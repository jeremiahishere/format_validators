#  Checks validity of values supplied for an object's currency/cost attribute
#
#  example usage:
#    validates :atrribute_to_check, :currency_format => true
class CurrencyFormatValidator < ActiveModel::EachValidator
  #  Compares object's currency/cost attribute against regex /^\d+(\.\d{2})?$/ for validity
  #  @param [BasicRecord] record, This is the object needing validation
  #  @param [Symbol] attribute, The attribute being validated, in this case :cost
  #  @param [String] value, The value of the attribute to compare against the regex
  #  @return [Boolean] True or false depending on if the value of the record's attribute is in the proper format
  def validate_each record, attribute, value
    strict_mode = options[:strict] || false
    
    format = /^\d*+(\.\d{1,2})?$/
    # Strict: requires leading number and exactly two decimals, 1.45
    format = /^\d+(\.\d{2})?$/ if strict_mode
    
    message = attribute.to_s.humanize + " must contain dollars and cents, seperated by a period"
    record.errors[attribute] << (options[:message] || message) unless value.to_s =~ format
  end
end
