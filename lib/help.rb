class Help < Command

  def exec
    message = <<EOS
Here is list of available commands:
/start - bot greeting
/help - list of available commands
/make_gif - make Gif from provided source file
EOS
    print_message @bot, @chat_id, message
  end

end
