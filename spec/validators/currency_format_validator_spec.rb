require 'spec_helper'

describe CurrencyFormatValidator do
  describe ".validate_each" do
    before(:each) do
      @options = {:attributes => {}}
      @validator = CurrencyFormatValidator.new(@options)
      @record = BasicRecord.new(:cost)
    end

    it "should validate the format for ###.##" do
      @record.errors[:cost].should_not_receive("<<")
      @validator.validate_each(@record, :cost, "123.45")
    end

    it "should validate the format for ##.##" do
      @record.errors[:cost].should_not_receive("<<")
      @validator.validate_each(@record, :cost, "23.45")
    end

    it "should validate the format for 0.##" do
      @record.errors[:cost].should_not_receive("<<")
      @validator.validate_each(@record, :cost, "0.45")
    end

    it "should validate the format for ##" do
      @record.errors[:cost].should_not_receive("<<")
      @validator.validate_each(@record, :cost, "45")
    end

    it "should not validate the format for #.#.#" do
      @record.errors[:cost].should_receive("<<")
      @validator.validate_each(@record, :cost, "4.5.6")
    end

    it "should not validate the format for string" do
      @record.errors[:cost].should_receive("<<")
      @validator.validate_each(@record, :cost, "word")
    end

    it "should not validate the format for #.#" do
      @record.errors[:cost].should_receive("<<")
      @validator.validate_each(@record, :cost, "1.2")
    end

    it "should not validate the format for .##" do
      @record.errors[:cost].should_receive("<<")
      @validator.validate_each(@record, :cost, ".99")
    end
  end
end
