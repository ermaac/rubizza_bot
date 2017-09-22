require_relative 'command.rb'

class AskForFileCommand < Command
  def exec
    print_message @bot, @chat_id, "Please, attach a video file for your future gif"
  end
end
