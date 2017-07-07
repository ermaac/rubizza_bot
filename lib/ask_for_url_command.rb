class AskForUrlCommand < Command

  def exec
    print_message @bot, @chat_id, "Please, specify the URL of content for gif"
  end

end
