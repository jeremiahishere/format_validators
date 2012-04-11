#
# Counties use abbreviations and will not validate otherwise
#
# Note: counties with abbreviations do not account for the full name
# example: Saint Lucie must be St. Lucie
#
class FloridaCountiesValidator < ActiveModel::EachValidator

  #
  # Checks the value parameter against a list of all Florida Counties
  # If the value contains the word county, it is considered invalid
  #
  # @param [ActiveRecord::Base] record; the record containing the value
  # @param [Symbol] attribute; the symbol used to access the value on the
  #   record
  # @param [String] value; The value of the attribute being validated
  #
  def validate_each record, attribute, value

    # normalize the value for later comparison
    value = value.to_s.downcase.split(' ').map {|w| w.capitalize }.join(' ')

    # Check the value does not contain the word county
    if value.include?("County")
      message = value + ' should not contain the word county.' 
      record.errors[attribute] << (options[:message] || message )
      
      # strip county to further normalize the string. This allows
      # the value to still be compared against the COUNTIES list
      value = value.gsub("County", "").strip
    end

    message = value + ' is not a county in Florida' 
    # push message into errors if the value is not found in the COUNTIES list
    record.errors[attribute] << (options[:message] || message ) unless COUNTIES.include? value
  end

  # List of known florida counties
  COUNTIES = [
    "Alachua",
    "Baker",
    "Bay",
    "Bradford",
    "Brevard",
    "Broward",
    "Calhoun",
    "Charlotte",
    "Citrus",
    "Clay",
    "Collier",
    "Columbia",
    "De Soto",
    "Suncoast",
    "Dixie",
    "Duval",
    "Escambia",
    "Flagler",
    "Franklin",
    "Gadsden",
    "Gilchrist",
    "Glades",
    "Gulf",
    "Hamilton",
    "Hardee",
    "Hendry",
    "Hernando",
    "Highlands",
    "Hillsborough Suncoast",
    "Holmes",
    "Indian River",
    "Jackson",
    "Jefferson",
    "Lafayette",
    "Lake",
    "Lee",
    "Leon",
    "Levy",
    "Liberty",
    "Madison",
    "Manatee",
    "Marion",
    "Martin",
    "Miami-Dade",
    "Monroe",
    "Nassau",
    "Okaloosa",
    "Okeechobee",
    "Orange",
    "Osceloa",
    "Palm Beach",
    "Pasco",
    "Pinellas",
    "Polk",
    "Putnam",
    "Santa Rosa",
    "Sarasota",
    "Seminole",
    "St. Johns",
    "St. Lucie",
    "Sumter",
    "Suwannee",
    "Taylor",
    "Union",
    "Volusia",
    "Wakulla",
    "Walton",
    "Washington"]
end
