require "tempfile"

class MakeGifCommand < Command

  def exec
    print_message @bot, @chat_id, "Please, wait, it can take a while"
    make_gif
  end

  def make_gif
    response = get_response_with_gif
    send_response response
  end

  def get_response_with_gif
    response = make_request "https://api.gifs.com/media/import?source=#{@url}"
    JSON.parse response
  end

  def send_response response
    if response["success"]
      address = response["success"]["files"]["gif"]
      file_content = make_request address
      send_gif file_content
    else
      print_message @bot, @chat_id, "Sorry, something goes wrong"
    end
  end

  def send_gif file_content
    ::Tempfile.open(["temp", ".gif"]) do |f|
      f.write file_content
      print_message @bot, @chat_id, "Your gif is uploading..."
      send_doc @bot, @chat_id, f.path, "gif"
    end
  end

end
