#counties use abbreviations and will not validate otherwise
# ex: Saint Lucie must be St. Lucie
class FloridaCountiesValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    value = value.downcase.split(' ').map {|w| w.capitalize }.join(' ')

    # this part has not been tested
    if value.include?("County")
      message = value + ' county should not contain the word county.' 
      record.errors[attribute] << (options[:message] || message )
      value.gsub("County", "").trim
    end

    message = value + ' is not a county in Florida' 
    record.errors[attribute] << (options[:message] || message ) unless COUNTIES.include? value

  end

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
