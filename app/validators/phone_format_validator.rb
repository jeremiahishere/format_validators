# Custom Validations for Phone Number format
#
# Currently only has support for north american phone numbers.  Additional support will be added later
#
# e.g. validates :home_phone, :phone_format => true
# e.g. validates :cell_phone, :phone_format => { :allow_blank => true, :if => :method_returns_true }
#
# Validates 7, 10, and 11 digit hone numbers to the NANP standard
# Handles parentheses, +, -  and white space in the phone number
class PhoneFormatValidator < ActiveModel::EachValidator

  # validates the phone number
  # defaults to north america region
  #
  # removes parens, dash, space, and plus from numbers
  # checks for non digit characters in the number
  # checks against regional format validator
  # adds errors if necessary
  # @param [ActiveRecord::Base] record The record to validate
  # @param [Symbol] attribute The field on the record to validate
  # @param [String] value The value of the attribute
  def validate_each record, attribute, value
    region = options[:region] || :north_america
    
    formatted_value = value.gsub(/[\s\.\+\(\)-]*/, "")
    is_number = !(formatted_value =~ /^[-+]?[0-9]+$/).nil?  # it returns 0 if it is a number with digits 0-9 or nil if not
    unless is_number && validate_by_region(region, formatted_value)
      message = attribute.to_s.humanize + ' doesn\'t match an acceptable format.'
      record.errors[attribute] << (options[:message] || message )
    end
  end

  # Validates a phone number by region
  #
  # Currently only supports the north_america region
  # @param [Symbol] region The phone number region to check against
  # @param [String] formatted_value Formatted phone number, guaranteed to be all digits
  # @return [Boolean] Whether the formatted value passes region validations
  def validate_by_region(region, formatted_value)
    if region == :north_america
      valid_eleven_digit?(formatted_value) || valid_ten_digit?(formatted_value) || valid_seven_digit?(formatted_value)
    else
      false
    end
  end

  # @param [String] input String representation of a phone number with non digit characters removed
  # @return [Boolean] True if it is seven digits long and the first digit is not 1 or 0
  def valid_seven_digit?(input)
    input.length == 7 && input[0] != "0" && input[0] != "1"
  end

  # @param [String] input String representation of a phone number with non digit characters removed
  # @return [Boolean] True if it is 10 digits long, first digit not 1 or 0 and the last 7 digits validate
  def valid_ten_digit?(input)
    input.length == 10 && input[0] != "0" && input[0] != "1" && valid_seven_digit?(input.slice(-7, 7))
  end

  # @param [String] input String representation of a phone number with non digit characters removed
  # @return [Boolean] Same as the ten digit with a 1 in front
  def valid_eleven_digit?(input)
    input.length == 11 && input[0] == "1" && valid_ten_digit?(input.slice(-10, 10))
  end
end
