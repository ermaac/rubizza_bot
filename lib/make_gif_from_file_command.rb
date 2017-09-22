require_relative 'command.rb'
require_relative 'working_with_net.rb'
require 'json'
require_relative 'make_gif_command.rb'
require 'dotenv/load'

class MakeGifFromFileCommand < MakeGifCommand
  include WorkingWithNet
  TELEGRAM_FILE_URL = "https://api.telegram.org/file/bot#{ENV['TOKEN']}/"
  TELEGRAM_FILE_INFO_URL = "https://api.telegram.org/bot#{ENV['TOKEN']}/getFile?file_id="

  def initialize bot, message
    super
    file_path = get_file_path
    @url = TELEGRAM_FILE_URL + file_path
  end

  def get_file_path
    response = make_request(TELEGRAM_FILE_INFO_URL + @message.video.file_id)
    response = JSON.parse response
    response["result"]["file_path"] if response["result"]
  end
end
