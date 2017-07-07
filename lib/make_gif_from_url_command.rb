require_relative "working_with_net.rb"
require_relative "make_gif_command.rb"
require 'json'

class MakeGifFromUrlCommand < MakeGifCommand

  include WorkingWithNet

  def initialize bot, message, url
    super bot, message
    @url = url
  end

end
