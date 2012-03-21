require 'spec_helper'

describe Building do
  before(:each) do
    @building = Building.new
  end


  it "should fail validations on an empty county" do
    @building.county = nil
    @building.should have(1).error_on(:county)
  end

  it "should fail validations on a bad county" do
    @building.county = "Orlando"
    @building.should have(1).error_on(:county)
  end

  it "should pass validations on a good county" do
    @building.county = "Orange"
    @building.should have(0).error_on(:county)
  end
end
