require 'luhnacy'

# Wrapper around algorithm luhn gem
# https://github.com/rorymckinley/luhnacy
class CreditCardValidator
  private_class_method :new

  VALID = "valid"
  INVALID = "invalid"

  def self.validate(number)
    Luhnacy.valid?(number.to_s.delete(' ')) ? VALID : INVALID 
  end
end
