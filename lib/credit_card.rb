require './lib/credit_card_identifier'
require './lib/credit_card_validator'

class CreditCard

  def initialize(credit_card_number)
    @credit_card_number = credit_card_number.to_s.delete(' ')
  end

  def to_s
    CreditCardIdentifier.identify(@credit_card_number) + 
      ": " +
      @credit_card_number.to_s +
      " (" +
      CreditCardValidator.validate(@credit_card_number) +
      ")"
  end

end
