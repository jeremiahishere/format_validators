# this class is used to test the validators
# it contains the methods needed to mimic and ActiveRecord::Base for the validators
class BasicRecord
  def initialize(attribute)
    @errors = {attribute => []}
  end

  def errors
    @errors
  end
end
