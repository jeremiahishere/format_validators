# Custom Validations for Email format
# This is not a great regular expression but it will work for now
#
# e.g. validates :home_email, :email_format => true
# e.g. validates :work_email, :email_format => { :allow_blank => true, :if => :method_returns_true }
class EmailFormatValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    format = /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/
    message = attribute.to_s.humanize + ' doesn\'t match an acceptable format.'
    record.errors[attribute] << (options[:message] || message ) unless value =~ format
  end
end
