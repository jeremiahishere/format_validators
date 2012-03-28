# Custom Validations for Phone Number format

# e.g. validates :home_phone, :phone_format => true
# e.g. validates :cell_phone, :phone_format => { :allow_blank => true, :if => :method_returns_true }
class PhoneFormatValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    format = /^1?[-\. ]?(\(\d{3}\)?[-\. ]?|\d{3}?[-\. ]?)?\d{3}?[-\. ]?\d{4}$/
    message = attribute.to_s.humanize + ' doesn\'t match an acceptable format.'
    record.errors[attribute] << (options[:message] || message ) unless value =~ format
  end
end
