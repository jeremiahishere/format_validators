require 'spec_helper'

describe NorthAmericanPhoneFormatValidator do
  before(:each) do
    @options = {:attributes => {}}
    @validator = NorthAmericanPhoneFormatValidator.new(@options)
  end

  describe ".validate_seven_digit?" do
    it "should return false if the length isn't 7" do
      @validator.valid_seven_digit?("4321").should be_false
    end

    it "should return false if the first digit is 0" do
      @validator.valid_seven_digit?("0123456").should be_false
    end

    it "should return false if the first digit is 1" do
      @validator.valid_seven_digit?("1234567").should be_false
    end

    it "should return true if all requirements are met" do
      @validator.valid_seven_digit?("2345678").should be_true
    end
  end

  describe ".validate_ten_digit?" do
    before(:each) do
      @validator.stub!(:valid_seven_digit?).and_return(true)
    end

    it "should return false if the length isn't 10" do
      @validator.valid_ten_digit?("4321").should be_false
    end
    
    it "should return false if the first digit is 0" do
      @validator.valid_ten_digit?("0123456789").should be_false
    end

    it "should return false if the first digit is 1" do
      @validator.valid_ten_digit?("1234567890").should be_false
    end

    it "should return false if it fails seven digit validation" do
      @validator.should_receive(:valid_seven_digit?).and_return(false)
      @validator.valid_ten_digit?("2345678901").should be_false
    end

    it "should return true if all requirements are met" do
      @validator.valid_ten_digit?("2345678901").should be_true
    end
  end

  describe ".validate_ten_digit?" do
    before(:each) do
      @validator.stub!(:valid_ten_digit?).and_return(true)
    end

    it "should return false if the length isn't 11" do
      @validator.valid_eleven_digit?("4321").should be_false
    end

    it "should return false if the first digit is not 1" do
      @validator.valid_eleven_digit?("22234567890")
    end

    it "should return false if it fails ten digit validation" do
      @validator.should_receive(:valid_ten_digit?).and_return(false)
      @validator.valid_eleven_digit?("12234567890").should be_false
    end

    it "should return true if all requirements are met" do
      @validator.valid_eleven_digit?("12234567890").should be_true
    end
  end

  describe ".validate_each" do
    before(:each) do
      @record = BasicRecord.new(:phone)
    end

    it "should call valid_seven_digit"
    it "should call valid_ten_digit"
    it "should call valid_eleven_digit"
    it "should not call any of those if not all numbers"
    it "should not add an error due to allowed special characters" do
      @record.errors[:phone].should_not_receive("<<")
      @validator.validate_each(@record, :phone, "()+.- 12345678901")
    end
    it "should add an error on a bad phone number"
  end
end
