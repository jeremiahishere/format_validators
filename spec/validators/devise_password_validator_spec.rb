require 'spec_helper'

describe DevisePasswordValidator do
  describe ".validate_each" do
    before(:each) do
      @options = {:attributes => {}}
      @validator = DevisePasswordValidator.new(@options)
      @record = BasicRecord.new(:password)
      @record.stub!(:password)
      @record.stub!(:password_confirmation)
      @record.stub!(:id)
      @record.stub!(:reset_password_token)
    end

    it "should validate a password of at least 6 characters, no spaces, and password is not being reset" do
      @record.errors[:password].should_not_receive("<<")
      @record.stub!(:password).and_return("goodpa")
      @record.stub!(:password_confirmation).and_return("goodpa")
      @validator.validate_each(@record, :password, "goodpa")
    end

    it "should not validate if password is not at least 6 characters" do
      @record.errors[:password].should_receive("<<")
      @record.stub!(:password).and_return("badpa")
      @record.stub!(:password_confirmation).and_return "badpa"
      @validator.validate_each(@record, :password, "badpa")
    end
    
    it "should not validate if password has a space" do
      @record.errors[:password].should_receive("<<")
      @record.stub!(:password).and_return "bad pass"
      @record.stub!(:password_confirmation).and_return "bad pass"
      @validator.validate_each(@record, :password, "bad pass")
    end
    
    it "should not validate if password does not match password confirmation" do
      @record.errors[:password].should_receive("<<")
      @record.stub!(:password).and_return "goodpa"
      @record.stub!(:password_confirmation).and_return "goodpa2"
      @validator.validate_each(@record, :password, "goodpa")
    end
    
    it "should not validate if password is blank and the record has no id" do
      @record.errors[:password].should_receive("<<")
      @record.stub!(:password).and_return ""
      @record.stub!(:password_confirmation).and_return ""
      @validator.validate_each(@record, :password, "")
    end
    
    it "should validate if password is blank and the record has an id and the reset token is blank" do
      @record.errors[:password].should_not_receive("<<")
      @record.stub!(:password).and_return ""
      @record.stub!(:id).and_return "1"
      @record.stub!(:password_confirmation).and_return ""
      @validator.validate_each(@record, :password, "")
    end
    
    it "should not validate if password is blank and the record has an id and the reset token is not blank" do
      @record.errors[:password].should_receive("<<")
      @record.stub!(:password).and_return ""
      @record.stub!(:id).and_return "1"
      @record.stub!(:reset_password_token).and_return "alhbasdhkhlb"
      @record.stub!(:password_confirmation).and_return ""
      @validator.validate_each(@record, :password, "")
    end

  end
end
