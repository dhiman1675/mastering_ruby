# frozen_string_literal: true

require 'benchmark'

# Q: Write a method to remove duplicates from an array while preserving the order of first occurrence
# my approch
def remove_duplicates(array)
  res = []
  array.each { |i| res << i unless res.include?(i) }
  puts res
end

# GROK my code and found out my code has 2 issues
# Time Complexity: The include? method on an array has a time complexity of O(n) for each check,
#                   leading to an overall time complexity of O(n^2) for the entire array,
#                     where n is the number of elements in the array. This can be very slow for large arrays.
# Inefficient Use of Memory: By using << to append to res, you're modifying the array in each iteration,
#                             which can lead to memory reallocations.
# So I am trying to show that my simple looking code is taking more time as array size increases
# as compare to the bellow using # Benchmark #
def remove_duplicates2(array)
  # Use a hash for O(1) lookup time to check for duplicates
  seen = {}
  res = []

  array.each do |element|
    unless seen.key?(element)
      res << element
      seen[element] = true
    end
  end

  puts res
end

array = Array.new(1_000_000) { [1, 2, 3, 4, 5].sample }
time = Benchmark.measure { remove_duplicates(array) }
puts "Remove Duplicates Time: #{time.real}"

time2 = Benchmark.measure { remove_duplicates2(array) }
puts "Remove Duplicates Time2: #{time2.real}"
