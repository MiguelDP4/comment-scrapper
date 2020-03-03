class Validate
  def validate_input_is_number(input, min, max)
    if input.is_a?(Integer)
      input >= min && input <= max
    else
      false
    end
  end
end
