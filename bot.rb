require 'telegram/bot'
require 'dotenv/load'

LIB_PATH = "lib"
Dir.foreach(LIB_PATH){|f| require_relative File.join(LIB_PATH,f) if f =~ /.*\.rb/}

def content_for_gif? bot, message
  return MakeGifFromUrlCommand.new(bot, message, message.text) if message.text =~ %r{https?://.*\..*/?.*}
  return MakeGifFromFileCommand.new(bot, message) if message[:video]
  nil
end

def get_general_command bot, message
  command = message.text.downcase.to_sym if message.text
  return COMMANDS[command].new bot, message if COMMANDS.include? command
  result = content_for_gif? bot, message
  result ||= UnknownCommand.new bot, message
end

def make_gif_command bot, message
  case message.data
  when "Via URL" then AskForUrlCommand.new bot, message
  when "From file on your device" then AskForFileCommand.new bot, message
  end
end

COMMANDS = {"/make_gif": ContentProvideWayCommand, "/start": Start, "/help": Help}
def get_command bot, message
  case message
  when Telegram::Bot::Types::Message then get_general_command bot, message
  when Telegram::Bot::Types::CallbackQuery then make_gif_command bot, message
  end
end

Telegram::Bot::Client.run(ENV["TOKEN"]) do |bot|
  bot.listen do |message|
    Thread.start do
      command = get_command bot, message
      command.exec
    end
  end
end
