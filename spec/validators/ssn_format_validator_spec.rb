require 'spec_helper'

describe SsnFormatValidator do
  describe ".validate_each" do
    before(:each) do
      @options = {:attributes => {}}
      @validator = SsnFormatValidator.new(@options)
      @record = BasicRecord.new(:ssn)
    end

    it "should validate the format for ###-##-####" do
      @record.errors[:ssn].should_not_receive("<<")
      @validator.validate_each(@record, :ssn, "123-45-6789")
    end

    it "should validate the format for #########" do
      @record.errors[:ssn].should_not_receive("<<")
      @validator.validate_each(@record, :ssn, "123456789")
    end

    it "should add a record to the errors hash if the validation fails" do
      @record.errors[:ssn].should_receive("<<")
      @validator.validate_each(@record, :ssn, "12345")
    end

    it "should have a default error message" do
      @record.errors[:ssn].should_receive("<<").with("Ssn does not match the format ###-##-####.")
      @validator.validate_each(@record, :ssn, "12345")
    end

    describe "bad ssn formats" do
      before(:each) do
        @record.errors[:ssn].should_receive("<<")
      end

      after(:each) do
        @validator.validate_each(@record, :ssn, @value)
      end

      it "should not be valid if of the format 2-2-4" do
        @value = "11-11-1111"
      end
      
      it "should not be valid if of the format 4-2-4" do
        @value = "1111-11-1111"
      end
      
      it "should not be valid if of the format 4-2-4" do
        @value = "1111-11-1111"
      end
      
      it "should not be valid if of the format 3-1-4" do
        @value = "111-1-1111"
      end
      
      it "should not be valid if of the format 3-3-4" do
        @value = "111-111-1111"
      end
      
      it "should not be valid if of the format 3-2-3" do
        @value = "111-11-111"
      end
      
      it "should not be valid if of the format 3-2-5" do
        @value = "111-11-11111"
      end
      
      it "should not be valid if of the format 8" do
        @value = "11111111"
      end
      
      it "should not be valid if of the format 10" do
        @value = "1111111111"
      end
      
      it "should not be valid if it is not numbers" do
        @value = "aaaaaaaaa"
      end
      
      it "should not be valid if it is not numbers and it has dashes" do
        @value = "aaa-aa-aaaa"
      end
      
      it "should not be valid if of the format 3-6" do
        @value = "111-111111"
      end
    end
  end
end
