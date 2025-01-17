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

def ternary_search_recursive(arr, left, right, target)
  return -1 if left > right

  partition_size = (right - left) / 3
  mid1 = left + partition_size
  mid2 = right - partition_size

  # Check if target is at any of the midpoints
  if arr[mid1] == target
    mid1
  elsif arr[mid2] == target
    mid2
  # Decide which third to search
  elsif target < arr[mid1]
    ternary_search_recursive(arr, left, mid1 - 1, target)
  elsif target > arr[mid2]
    ternary_search_recursive(arr, mid2 + 1, right, target)
  else
    # If target is between mid1 and mid2, narrow down to this segment
    ternary_search_recursive(arr, mid1 + 1, mid2 - 1, target)
  end
end

sorted_array = [1, 2, 5, 5, 9, 33, 44, 53, 84]
sorted_array2 = [2, 3, 44, 67, 78, 89, 95, 103, 763, 999]
sorted_array3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts ternary_search(sorted_array, 53)
puts ternary_search(sorted_array2, 1113)
puts 'RECURSIVE:'
puts ternary_search_recursive(sorted_array3, 0, sorted_array3.length - 1, 7)
puts ternary_search_recursive(sorted_array, 0, sorted_array.length - 1, 53)
