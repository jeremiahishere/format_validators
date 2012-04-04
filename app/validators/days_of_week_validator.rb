class DaysOfWeekValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    value = value.to_s.downcase
    record.errors[attribute] << value + " is not a valid day of the week or abbreviation" unless DAYS.include?(value)
  end
    DAYS = [
      "monday",
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
