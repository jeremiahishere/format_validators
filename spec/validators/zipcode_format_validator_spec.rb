require 'spec_helper'

describe ZipcodeFormatValidator do
  describe ".validate_each" do
    before(:each) do
      @options = {:attributes => {}}
      @validator = ZipcodeFormatValidator.new(@options)
      @record = BasicRecord.new(:zip_code)
    end

    it "should validate 5 digit zip codes" do
      @record.errors[:zip_code].should_not_receive("<<")
      @validator.validate_each(@record, :zip_code, "12345")
    end

    it "should validate 9 digit zip codes with a space"do
      @record.errors[:zip_code].should_not_receive("<<")
      @validator.validate_each(@record, :zip_code, "12345 6789")
    end

    it "should validate 9 digit zip codes with a dash"do
      @record.errors[:zip_code].should_not_receive("<<")
      @validator.validate_each(@record, :zip_code, "12345-6789")
    end

    it "should not validate 9 digit zip codes with nothing between the first 5 and last 4"do
      @record.errors[:zip_code].should_receive("<<")
      @validator.validate_each(@record, :zip_code, "123456789")
    end

    it "should not validate zip codes of other lengths"do
      @record.errors[:zip_code].should_receive("<<")
      @validator.validate_each(@record, :zip_code, "123456")
    end

    it "does not have support for canadian zip codes"do
      @record.errors[:zip_code].should_receive("<<")
      @validator.validate_each(@record, :zip_code, "K1A OB1")
    end
  end
end
