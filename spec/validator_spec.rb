require_relative '../lib/input_validator.rb'

describe Validate do
  let(:validator) { Validate.new }

  describe '#validate_input_is_number' do
    it 'validates if input is an Integer' do
      expect(validator.validate_input_is_number('asdf', 0, 12)).not_to eql(true)
    end
    it 'validates if input is an Integer' do
      expect(validator.validate_input_is_number(2, 0, 15)).to eql(true)
    end
    it 'validates if input is an Integer' do
      expect(validator.validate_input_is_number(20, 0, 15)).to eql(false)
    end
  end
end
