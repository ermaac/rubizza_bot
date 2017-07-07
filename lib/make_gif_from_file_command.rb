require_relative "command.rb"
require_relative "working_with_net.rb"
require 'json'
require_relative "make_gif_command.rb"
require "curb"
require "tempfile"
require 'dotenv/load'

class MakeGifFromFileCommand < MakeGifCommand

  include WorkingWithNet

  def get_file
    file_path = get_file_path
    make_request "https://api.telegram.org/file/bot#{ENV['TOKEN']}/#{file_path}"
  end

  def get_response_with_gif
    gif_file_content = get_file
    temp_file = ::Tempfile.open("source") do |temp_file|
      temp_file.write gif_file_content
      curl = Curl::Easy.new("https://api.gifs.com/media/upload")
      curl.multipart_form_post = true
      curl.http_post(Curl::PostField.file('file', temp_file.path))
      JSON.parse curl.body_str
    end
  end

  def get_file_path
    response = make_request "https://api.telegram.org/bot#{ENV['TOKEN']}/getFile?file_id=#{@message.video.file_id}"
    response = JSON.parse response
    response["result"]["file_path"] if response["result"]
  end

end
