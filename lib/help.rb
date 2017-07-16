require_relative 'command.rb'

class Help < Command
  def exec
    message = <<~HELP
      Here is the list of available commands:
      /start - bot greeting
      /help - list of available commands
      /make_gif - make Gif from provided source file
    HELP
    print_message @bot, @chat_id, message
  end
end
