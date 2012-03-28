# Custom Validations for Zip Code format

# e.g. validates :zip, :zipcode_format => true
# e.g. validates :zip, :zipcode_format => { :allow_blank => true, :if => :method_returns_true }
class ZipcodeFormatValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    format = /^\A[\d]{5}(?:[-|\s][\d]{4})?\Z$/
    message = attribute.to_s.humanize + ' doesn\'t match an acceptable format.'
    record.errors[attribute] << (options[:message] || message ) unless value =~ format
  end
end
