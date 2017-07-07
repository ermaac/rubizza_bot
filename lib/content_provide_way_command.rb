class ContentProvideWayCommand < Command

	def exec
		message = get_message @chat_id, "Specify the way you want to provide content for Gif"
		keyboard = make_keyboard "From file on your device", "Via URL"
		markup = make_markup keyboard
		add_markup message, markup
		send_message @bot, message
	end

end