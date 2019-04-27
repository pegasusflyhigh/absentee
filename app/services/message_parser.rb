require 'net/http'
# Service to parse content of msg received in message textlocal
class MessageParser
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def parse
    short_code, standard_name, absentees_roll_numbers = @message.split(':') if @message
    absentees_roll_numbers = absentees_roll_numbers.split(',').collect(&:to_i) if absentees_roll_numbers
    [standard_name, absentees_roll_numbers]
  end
end
