require_relative 'bot_methods.rb'

class Command
  include BotMethods

  def initialize bot, message
    @bot = bot
    @message = message
    @chat_id = message.from.id
  end
end
