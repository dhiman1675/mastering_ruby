# frozen_string_literal: true

# This method implements the insertion sort algorithm.
# Insertion sort is a simple sorting algorithm that builds the final sorted array one item at a time.
# It is much less efficient on large lists than more advanced algorithms such as quicksort, heapsort,
# or merge sort.
#
# The algorithm iterates over each element in the array and inserts it into its correct position in
# the sorted portion of the array.
#
# Time Complexity:
# - Best case: O(n) when the array is already sorted.
# - Average and Worst case: O(n^2) when the array is sorted in reverse order or elements are randomly ordered.
#
# Space Complexity: O(1) as it is an in-place sorting algorithm.

require 'byebug'

def insertion_sort(arr)
  n = arr.length
  (1...n).each do |i|
    key = arr[i]
    j = i - 1

    while j >= 0 && arr[j] > key
      arr[j + 1] = arr[j]
      j -= 1
    end
    arr[j + 1] = key
  end
  arr
end

def insertion_sort_recursive(arr, n)
  return arr if n <= 1

  insertion_sort_recursive(arr, n - 1)

  last = arr[n - 1]
  j = n - 2

  while j >= 0 && arr[j] > last
    arr[j + 1] = arr[j]
    j -= 1
  end
  arr[j + 1] = last
  arr
end

puts insertion_sort([12, 11, 13, 5, 6]).join(', ')
# Output: [5, 6, 11, 12, 13]

puts insertion_sort_recursive([12, 11, 13, 5, 6], 5).join(', ')
# Output: [5, 6, 11, 12, 13]
