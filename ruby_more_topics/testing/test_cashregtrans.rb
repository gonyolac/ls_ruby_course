require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test

  def test_accept_money
    register = CashRegister.new(2000)
    transaction = Transaction.new(1000)
    transaction.amount_paid = 1000

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal previous_amount + 1000, current_amount
  end

  def test_change
    register = CashRegister.new(100)
    transaction = Transaction.new(50)
    transaction.amount_paid = 100

    assert_equal register.change(transaction), 50
  end

  def test_give_receipt
    item_cost = 100
    register = CashRegister.new(200)
    transaction = Transaction.new(item_cost)

    assert_output("You've paid $#{item_cost}.\n") do
     register.give_receipt(transaction)
    end
  end
end

# essentially create small instances of class that is being tested
# as you would test manually, with assert methods verifying the outputs