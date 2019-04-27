require 'net/http'
# Service to send sms using textlocal
class TextlocalTextMessenger
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def send(numbers, unicode = false)
    requested_url = "#{TEXTLOCAL_BASE_URL}/send?"
    uri = URI.parse(requested_url)
    test_mode = !Rails.env.production?
    res = Net::HTTP.post_form(uri, 'apikey' => TEXTLOCAL_API_KEY, 'message' => message, 'numbers' => numbers, 'test' => test_mode, 'unicode' => unicode)
    p JSON.parse(res.body)
  end
end
