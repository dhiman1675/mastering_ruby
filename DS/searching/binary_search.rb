# frozen_string_literal: true

def binary_search(arr, target)
  left = 0
  right = arr.length - 1

  while left <= right
    mid = (left + right) / 2
    # puts "Array's Mid(#{mid}) #{arr[mid]}"
    if arr[mid] == target
      return mid # Target found, return index
    elsif arr[mid] < target
      left = mid + 1 # Search in the right half
    else
      right = mid - 1 # Search in the left half
    end
  end

  -1 # Target not found
end

def recursive_binary(arr, target)
  left = 0
  right = arr.length - 1
  while left <= right
    mid = (left + right) / 2
    if arr[mid] == target
      return mid
    elsif arr[mid] < target
      # left = mid + 1
      recursive_binary(arr[mid + 1..right], target)
    else
      # right = mid - 1
      recursive_binary(arr[left..mid - 1], target)
    end
  end

  -1
end

# Example Usage
arr = [1, 3, 5, 7, 9]
puts binary_search(arr, 5) # Output: 2
puts binary_search(arr, 8) # Output: -1

# Binary search is searching algorithm which works in sorted arrays.
# Fist separates the array from mid, if the target value is less than the middle element,
# the search continues in the left half. Otherwise, it searches in the right half

# Binary search using Recursion
puts binary_search(arr, 222)
puts binary_search(arr, 9)
