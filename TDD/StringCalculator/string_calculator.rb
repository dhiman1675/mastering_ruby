# frozen_string_literal: true

# require 'byebug'
# Class to perform number's sum
class StringCalculator
  def add(numbers)
    # Converts escaped newline characters,
    # because its causing issue when passing args from console
    numbers = numbers.gsub("\\n", "\n")
    return 0 if numbers.empty?

    delimiter = /,|\n/
    numbers, delimiter = acc_to_custom_delimeter(numbers) if numbers.start_with?('//')

    nums = numbers.split(/#{delimiter}/).map(&:to_i)

    negatives = nums.select(&:negative?)
    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?

    nums.sum
  end

  private

  def acc_to_custom_delimeter(numbers)
    custom_delimiter_match = numbers.match(%r{^//(.+)\n})
    custom_delimiter = custom_delimiter_match[1] || custom_delimiter_match[2]
    [numbers.split("\n", 2)[1], Regexp.new("#{Regexp.escape(custom_delimiter)}|\\n")]
  end
end

# write this code to pass arguments from console
if __FILE__ == $PROGRAM_NAME
  calculator = StringCalculator.new
  input = ARGV[0] || ''
  puts calculator.add(input)
end
