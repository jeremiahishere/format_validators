# Custom Validations for Phone Number format

# e.g. validates :home_phone, :phone_format => true
# e.g. validates :cell_phone, :phone_format => { :allow_blank => true, :if => :method_returns_true }
#
# Validates 7, 10, and 11 digit hone numbers to the NANP standard
# Handles parentheses, +, -  and white space in the phone number
class NorthAmericanPhoneFormatValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    formatted_value = value.gsub(/[\s\.\+\(\)-]*/, "")
    unless (formatted_value.to_i && (valid_eleven_digit?(formatted_value) || valid_ten_digit?(formatted_value) || valid_seven_digit?(formatted_value)))
      message = attribute.to_s.humanize + ' doesn\'t match an acceptable format.'
      record.errors[attribute] << (options[:message] || message )
    end
  end

  # @return [Boolean] True if it is seven digits long and the first digit is not 1 or 0
  def valid_seven_digit?(input)
    input.length == 7 && input[0] != "0" && input[0] != "1"
  end

  # @return [Boolean] True if it is 10 digits long, first digit not 1 or 0 and the last 7 digits validate
  def valid_ten_digit?(input)
    input.length == 10 && input[0] != "0" && input[0] != "1" && valid_seven_digit?(input.slice(-7, 7))
  end

  # @return [Boolean] Same as the ten digit with a 1 in front
  def valid_eleven_digit?(input)
    input.length == 11 && input[0] == "1" && valid_ten_digit?(input.slice(-10, 10))
  end
end
