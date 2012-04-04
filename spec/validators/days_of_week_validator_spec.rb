require 'spec_helper'

describe DaysOfWeekValidator do

  describe ".validate_each" do
    before(:all) do
      @options = {:attributes => {}}
      @validator = DaysOfWeekValidator.new(@options)
      @record = BasicRecord.new(:days)
    end

    it "should return true for valid day names" do
      @record.errors[:days].should_not_receive("<<")
      @validator.validate_each(@record, :days, "MONDAY")
    end

    it "should return true for valid day abbreviation" do
      @record.errors[:days].should_not_receive("<<")
      @validator.validate_each(@record, :days, "WED")
    end

    it "should return true for valid day abbreviation" do
      @record.errors[:days].should_not_receive("<<")
      @validator.validate_each(@record, :days, "TU")
    end

    it "should return false for invalid days" do
      @record.errors[:days].should_receive("<<")
      @validator.validate_each(@record, :days, "kajhef")
    end

    it "should return false for invalid days" do
      @record.errors[:days].should_receive("<<")
      @validator.validate_each(@record, :days, "GDHSKFBF HGVHEHJF 5636464 FHFGGG")
    end

    it "should return false for blank string" do
      @record.errors[:days].should_receive("<<")
      @validator.validate_each(@record, :days, "")
    end

    it "should return false for nil" do
      @record.errors[:days].should_receive("<<")
      @validator.validate_each(@record, :days, nil)
    end
  end
end
