require_relative 'command.rb'
require_relative 'working_with_net.rb'
require 'json'
require_relative 'make_gif_command.rb'
require 'dotenv/load'

class MakeGifFromFileCommand < MakeGifCommand
  include WorkingWithNet

  def initialize bot, message
    super
    file_path = get_file_path
    @url = "https://api.telegram.org/file/bot#{ENV['TOKEN']}/#{file_path}"
  end

  def get_file_path
    response = make_request "https://api.telegram.org/bot#{ENV['TOKEN']}/getFile?file_id=#{@message.video.file_id}"
    response = JSON.parse response
    response["result"]["file_path"] if response["result"]
  end
end
