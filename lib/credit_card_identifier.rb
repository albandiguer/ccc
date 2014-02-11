class CreditCardIdentifier
  private_class_method :new 

  # Credit cards types
  AMEX = "AMEX"
  DISCOVER = "Discover"
  MASTER_CARD = "MasterCard"
  VISA = "VISA"
  UNKNOWN = "Unknown"

  PATTERNS = { 
    AMEX => %r(^(34|37)\d{13}$), # begins_with: [34, 37], number_length: 15
    DISCOVER => %r(^6011\d{12}$), # begins_with: 6011, number_length: 16
    MASTER_CARD => %r(^5[1-5]\d{14}$), # begins_with: 51..55, number_length: 16
    VISA => %r(^4\d{12}\d{3}?$) # begins_with: 51..55, number_length: [13, 16]
  }.freeze

  # Params: 
  #   - Credit card number (String)
  # Returns a credit card type (String) 
  def self.identify(credit_card_number)
    new(credit_card_number).send(:extract_type)
  end

private 

  def initialize(credit_card_number)
    @credit_card_number = credit_card_number.to_s.delete(' ')
  end

  def extract_type
    begin
      PATTERNS.find{|k, v| v =~ @credit_card_number}.first
    rescue
      return UNKNOWN
    end
  end

end
