require_relative "command.rb"

class UnknownCommand < Command
  def exec
    raw_message = "Unknown command #{@message.text}"
    message = get_message @chat_id, raw_message
    send_message @bot, message
  end
end
