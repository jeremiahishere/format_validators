class CurrencyFormatValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    strict_mode = options[:strict] || false
    
    format = /^\d*+(\.\d{1,2})?$/
    # Strict: requires leading number and exactly two decimals, 1.45
    format = /^\d+(\.\d{2})?$/ if strict_mode
    
    message = attribute.to_s.humanize + " must contain dollars and cents, seperated by a period"
    record.errors[attribute] << (options[:message] || message) unless value.to_s =~ format
  end
end
