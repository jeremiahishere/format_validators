require 'spec_helper'

describe EmailFormatValidator do
  describe ".validate_each" do
    before(:each) do
      @options = {:attributes => {}}
      @validator = EmailFormatValidator.new(@options)
      @record = BasicRecord.new(:email)
    end
    
    it "should accept emails of the format jeremiah@cloudspace.com" do
      @record.errors[:email].should_not_receive("<<")
      @validator.validate_each(@record, :email, "jeremiah@cloudspace.com")
    end

    it "should not accept emails of the format jeremiah@cloudspace@com" do
      @record.errors[:email].should_receive("<<")
      @validator.validate_each(@record, :email, "jeremiah@cloudspace@com")
    end
  end
end
