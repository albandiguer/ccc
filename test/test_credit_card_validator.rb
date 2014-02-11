require './lib/credit_card_validator'
require 'luhnacy'

class TestCreditCardValidator < MiniTest::Test

  @unit
  def test_refute_respond_to_new
    refute_respond_to(CreditCardValidator, :new)
  end

  @unit
  def test_assert_respond_to_validate
    assert_respond_to(CreditCardValidator, :validate)
  end

  @unit
  def test_credit_card_validation_states
    assert_equal(CreditCardValidator::VALID, 'valid')
    assert_equal(CreditCardValidator::INVALID, 'invalid')
  end

  @integration
  def test_validate
    assert_equal(CreditCardValidator.validate(4111111111111111), "valid")
    assert_equal(CreditCardValidator.validate(4111111111111), "invalid")
    assert_equal(CreditCardValidator.validate(4012888888881881), "valid")
    assert_equal(CreditCardValidator.validate(378282246310005), "valid")
    assert_equal(CreditCardValidator.validate(6011111111111117), "valid")
    assert_equal(CreditCardValidator.validate(5105105105105100), "valid")
    assert_equal(CreditCardValidator.validate('5105 1051 0510 5106'), "invalid")
    assert_equal(CreditCardValidator.validate(9111111111111111), "invalid")
  end
end
