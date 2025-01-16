# frozen_string_literal: true

require 'byebug'

def ternary_search(arr, target)
  left = 0
  right = arr.length - 1
  while left < right
    partition_size = (right - left) / 3
    mid1 = left + partition_size
    mid2 = right - partition_size
    return mid1 if target == arr[mid1]
    return mid2 if target == arr[mid2]

    if target < arr[mid1]
      right = mid1 - 1
    elsif target > arr[mid2]
      left = mid2 + 1
    else
      left = mid1 + 1
      right = mid2 - 1
    end
  end
  -1
end

input = [1, 2, 5, 5, 9, 33, 44, 53, 84]
input2 = [2, 3, 44, 67, 78, 89, 95, 103, 763, 999]
puts ternary_search(input, 53)
puts ternary_search(input2, 1113)
