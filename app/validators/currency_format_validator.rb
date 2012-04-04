class CurrencyFormatValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    format = /^\d*+(\.\d{1,2})?$/
    message = attribute.to_s.humanize + " must contain dollars and cents, seperated by a period"
    record.errors[attribute] << (options[:message] || message) unless value =~ format
  end
end
