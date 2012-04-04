require 'spec_helper'

describe CurrencyFormatValidator do
  before :each do
    @validator = CurrencyFormatValidator.new attributes: {}
    @mock = mock
    @mock.stub!(:errors).and_return([])
    @mock.errors.stub!(:[]).and_return({})
    @mock.errors[].stub!(:<<)
  end
  
  subject { @validator }
  
  # Correct data yields no errors!
  context 'with perfectly valid, correctly-formatted input should produce no errors' do
    before { @mock.should_not_receive :errors }
    it { subject.validate_each @mock, 'date', '123.45' }
    it { subject.validate_each @mock, 'date', '23.45' }
    it { subject.validate_each @mock, 'date', '0.45' }
    it { subject.validate_each @mock, 'date', '.45' }
    it { subject.validate_each @mock, 'date', '.4' }
    it { subject.validate_each @mock, 'date', '4' }
  end

  # Incorrect data yields errors!
  context 'with invalid input should produce a validation error' do
    before { @mock.errors[].should_receive :<< }
    it { subject.validate_each @mock, 'date', '23.456' }
    it { subject.validate_each @mock, 'date', 'two' }
    it { subject.validate_each @mock, 'date', '23..456' }
    it { subject.validate_each @mock, 'date', '23.45.6' }
    it { subject.validate_each @mock, 'date', '.234' }
  end
end
