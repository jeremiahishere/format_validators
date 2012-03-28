require 'spec_helper'

describe PhoneFormatValidator do
  describe ".validate_each" do
    before(:each) do
      @options = {:attributes => {}}
      @validator = PhoneFormatValidator.new(@options)
      @record = BasicRecord.new(:phone)
    end

    it "should validate 7 digit phone number" do
      @record.errors[:phone].should_not_receive("<<")
      @validator.validate_each(@record, :phone, "123-4567")
    end

    it "should validate 10 digit phone number without area code parentheses" do
      @record.errors[:phone].should_not_receive("<<")
      @validator.validate_each(@record, :phone, "321-123-4567")
    end

    it "should validate 10 digit phone number with area code parentheses" do
      @record.errors[:phone].should_not_receive("<<")
      @validator.validate_each(@record, :phone, "(321) 123-4567")
    end

    it "should validate 10 digit phone number with a 1 first" do
      @record.errors[:phone].should_not_receive("<<")
      @validator.validate_each(@record, :phone, "1-321-123-4567")
    end

    it "should allow dashes between numbers" do
      @record.errors[:phone].should_not_receive("<<")
      @validator.validate_each(@record, :phone, "1-321-123-4567")
    end

    it "should allow a single space between numbers" do
      @record.errors[:phone].should_not_receive("<<")
      @validator.validate_each(@record, :phone, "1 321 123 4567")
    end

    it "should allow multiple whitespace characters between numbers" do
      @record.errors[:phone].should_not_receive("<<")
      @validator.validate_each(@record, :phone, "123  4567")
    end

    it "should not validate 5 digit phone number" do
      @record.errors[:phone].should_receive("<<")
      @validator.validate_each(@record, :phone, "3-4567")
    end

  end
end
