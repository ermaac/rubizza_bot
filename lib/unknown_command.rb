require_relative 'command.rb'

class UnknownCommand < Command
  def exec
    print_message = "Unknown command #{@message.text}"
  end
end
