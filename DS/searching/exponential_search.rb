# frozen_string_literal: true

require_relative 'binary_search'

def exponential_search(arr, target)
  length = arr.length
  boundary = 1
  boundary *= 2 while boundary < length && arr[boundary] < target

  left = boundary / 2
  right = [boundary, length - 1].min
  res = binary_search(arr[left..right], target)
  # just because I am using my previous implementation of binary seacrch and
  # I am only passing a range of list to binary seacrch
  !res.negative? ? res + left : res
end

input = [0.12, 0, 1, 4, 6, 9, 12, 15, 17, 19, 22, 28]
puts "exponential_search result: #{exponential_search(input, 66)}" # -1
puts "exponential_search result: #{exponential_search(input, 6)}"  # 4
puts "exponential_search result: #{exponential_search(input, 0.11)}" # -1
