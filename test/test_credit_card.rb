require './lib/credit_card'

class TestCreditCard < MiniTest::Test
  
  @integration
  def test_credit_card_output
    assert_equal(CreditCard.new(4111111111111111).to_s, "VISA: 4111111111111111 (valid)")
    assert_equal(CreditCard.new(4111111111111).to_s, "VISA: 4111111111111 (invalid)")
    assert_equal(CreditCard.new(4012888888881881).to_s, "VISA: 4012888888881881 (valid)")
    assert_equal(CreditCard.new(378282246310005).to_s, "AMEX: 378282246310005 (valid)")
    assert_equal(CreditCard.new(6011111111111117).to_s, "Discover: 6011111111111117 (valid)")
    assert_equal(CreditCard.new(5105105105105100).to_s, "MasterCard: 5105105105105100 (valid)")
    assert_equal(CreditCard.new('5105 1051 0510 5106').to_s, "MasterCard: 5105105105105106 (invalid)")
    assert_equal(CreditCard.new(9111111111111111).to_s, "Unknown: 9111111111111111 (invalid)")
  end
end
