class Validate
  def validate_input_is_number(input, min, max)
    if input.is_a?(Integer)
      input >= min && input <= max
    else
      false
    end
  end

  def validate_yes_no(input)
    return false unless input.is_a?(String)
    unless input.downcase == 'y' || input.downcase == 'n' || input.downcase == 'yes' || input.downcase == 'no'
      return false
    end

    true
  end
end
