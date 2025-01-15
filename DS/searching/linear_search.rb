# frozen_string_literal: true

def linear_search(arr, target)
  arr.each_with_index do |element, index|
    return index if element == target
  end
  -1
end

input_arr = [3, 4, 7, 8, 33, 1, 11, 13, 41]

puts linear_search(input_arr, 1)
