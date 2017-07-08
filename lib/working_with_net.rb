require 'net/http'

module WorkingWithNet
  def make_request address
    uri = URI address
    Net::HTTP.get uri
  end
end
