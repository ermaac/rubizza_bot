module BotMethods
  def send_message bot, message
    bot.api.send_message message
  end

  def get_message chat_id, text_message
    {chat_id: chat_id, text: text_message}
  end

  def add_markup response, markup
    response[:reply_markup] = markup
  end

  def make_keyboard *buttons
    result = []
    buttons.each { |button_name| result << Telegram::Bot::Types::InlineKeyboardButton.new(text: button_name,
                                                                                          callback_data: button_name) }
    result
  end

  def make_markup kb
    markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
  end

  def print_message bot, chat_id, raw_message
    message = get_message chat_id, raw_message
    send_message bot, message
  end

  def send_doc bot, chat_id, document_address
    response = {chat_id: chat_id, document: document_address}
    bot.api.send_document response
  end
end
