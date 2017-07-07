require_relative "command.rb"

class Start < Command

  def exec
    message = <<EOS
Hello, #{@message.from.first_name}
This bot will help you to create gif from files of popular formats, such as .mp4, .flv, .avi directly from file on your device or provided via url(example: https://vine.co/v/idnLg0H1qFr)
Type /help for help
EOS
    print_message @bot, @chat_id, message
  end

end
