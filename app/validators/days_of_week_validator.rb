#  Checks validity of values supplied for an object's days of the week attribute
#
#  example usage:
#    validates :atrribute_to_check, :days_of_week => true

class DaysOfWeekValidator < ActiveModel::EachValidator
  #  Compares object's days of week attribute against days_of_week array for validity
  #  @param [BasicRecord] record, This is the object needing validation
  #  @param [Symbol] attribute, The attribute being validated
  #  @param [String] value, The value of the attribute to compare aginst the days_of_week array
  #  @return [Boolean] True or false depending on if the value of the record's attribute is contained within the days_of_week array
  def validate_each(record, attribute, value)
    value = value.to_s.downcase
    record.errors[attribute] << value + " is not a valid day of the week or abbreviation" unless self.days_of_week.include?(value)
  end
  
  #  All available days of the week and their abbreviations to be compared against for validation
  #  @return [Array] Array containing all available abbreviations for days of the week
  def self.days_of_week
    ["monday",
      "mon",
      "m",
      "tuesday",
      "tues",
      "tu",
      "t",
      "wednesday",
      "wed",
      "w",
      "thursday",
      "thurs",
      "th",
      "friday",
      "fri",
      "f",
      "saturday",
      "sat",
      "s",
      "sunday",
      "sun",
      "su"
    ]
  end
end