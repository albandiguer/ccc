require './lib/credit_card_identifier'

class TestCreditCardIdentifier < MiniTest::Test

  @unit
  def test_class_refute_new
    refute_respond_to(CreditCardIdentifier, :new)
  end

  @unit
  def test_credit_card_types
    assert_equal(CreditCardIdentifier::AMEX, 'AMEX')
    assert_equal(CreditCardIdentifier::DISCOVER, 'Discover')
    assert_equal(CreditCardIdentifier::MASTER_CARD, 'MasterCard')
    assert_equal(CreditCardIdentifier::VISA, 'VISA')
  end

  @unit
  def test_class_responds_to_identify
    assert_respond_to(CreditCardIdentifier, :identify)
  end

  @functional
  def test_identify
    assert_equal('VISA', CreditCardIdentifier.identify(4111111111111111))
    assert_equal('VISA', CreditCardIdentifier.identify(4111111111111))
    assert_equal('VISA', CreditCardIdentifier.identify(4012888888881881))
    assert_equal('AMEX', CreditCardIdentifier.identify(378282246310005))
    assert_equal('Discover', CreditCardIdentifier.identify(6011111111111117))
    assert_equal('MasterCard', CreditCardIdentifier.identify(5105105105105100))
    assert_equal('MasterCard', CreditCardIdentifier.identify('5105 1051 0510 5106'))
    assert_equal('Unknown', CreditCardIdentifier.identify(9111111111111111))
  end

end

