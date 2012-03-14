require 'spec_helper'

describe FloridaCountiesValidator do

  describe ".validate_each" do
    before(:all) do
      @options = {:attributes => {}}
      @validator = FloridaCountiesValidator.new(@options)
      @record = BasicRecord.new(:county)
    end

    it "should return false for invalid county" do
      @record.errors[:county].should_receive("<<")
      @validator.validate_each(@record, :county, "123456789")
    end
    
    it "should return true for valid county" do
      @record.errors[:county].should_not_receive("<<")
      @validator.validate_each(@record, :county, "Orange")
    end
    
    it "should validate lowercase county name" do
      @record.errors[:county].should_not_receive("<<")
      @validator.validate_each(@record, :county, "orange")
    end
    
    it "should validate all uppercase county name" do
      @record.errors[:county].should_not_receive("<<")
      @validator.validate_each(@record, :county, "ORANGE")
    end
  
    it "should validate multi word count" do
      @record.errors[:county].should_not_receive("<<")
      @validator.validate_each(@record, :county, "St. Lucie")
    end 
   
  end

end
