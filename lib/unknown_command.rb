require_relative 'command.rb'

class UnknownCommand < Command
  def exec
    print_message @bot, @chat_id, "Unknown command #{@message.text}"
  end
end
