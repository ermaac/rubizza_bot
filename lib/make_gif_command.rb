require 'tempfile'
require_relative 'command.rb'

class MakeGifCommand < Command
  GIF_API_URL = "https://api.gifs.com/media/import?source="

  def exec
    print_message @bot, @chat_id, "Please, wait, it can take a while"
    make_gif
  end

  def make_gif
    response = get_response_with_gif
    send_response response
  end

  def get_response_with_gif
    response = make_request(GIF_API_URL + @url)
    JSON.parse response
  end

  def send_response response
    if response["success"]
      document_address = response["success"]["files"]["gif"]
      send_doc @bot, @chat_id, document_address
    else
      print_message @bot, @chat_id, "Sorry, something goes wrong"
    end
  end
end
