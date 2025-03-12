# frozen_string_literal: true

# Demo bank example without db
class BankAccount
  # attr_accessor :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
    puts "\nDeposited: #{amount}. New Balance: #{@balance}"
  end

  def withdraw(amount)
    if amount > @balance
      puts "\nInsufficient balance!"
    else
      @balance -= amount
      puts "\nWithdrawn: #{amount}. New Balance: #{@balance}"
    end
  end

  def check_balance
    puts "\nCurrent Balance: #{@balance}"
  end
end

# Main program loop
account = BankAccount.new(1000)
# p account.balance

loop do
  puts "\nChoose an option:"
  puts '1. Deposit'
  puts '2. Withdraw'
  puts '3. Check Balance'
  puts '4. Exit'
  print 'Enter your choice: '

  choice = gets.chomp.to_i

  case choice
  when 1
    print 'Enter amount to deposit: '
    amount = gets.chomp.to_f
    account.deposit(amount)
  when 2
    print 'Enter amount to withdraw: '
    amount = gets.chomp.to_f
    account.withdraw(amount)
  when 3
    account.check_balance
  when 4
    puts 'Exiting... Goodbye!'
    break
  else
    puts 'Invalid choice, please try again.'
  end
end
