# Custom Validations for Social Security Number format
#
# e.g. validates :ssn, :ssn_format => true
# e.g. validates :ssn, :ssn_format => { :allow_blank => true, :if => :method_returns_true }
class SsnFormatValidator < ActiveModel::EachValidator

  # Checks input against a social security regex that matches ###-##-#### with or without dashes
  #
  # @param [ActiveRecord::Base] record The record to validate
  # @param [Symbol] attribute The field on the record to validate
  # @param [String] value The value of the attribute
  def validate_each record, attribute, value
    format = /^\A([\d]{3}\-[\d]{2}\-[\d]{4}|[\d]{9})\Z$/
    message = attribute.to_s.humanize + ' does not match the format ###-##-####.'
    record.errors[attribute] << (options[:message] || message ) unless value =~ format
  end
end
