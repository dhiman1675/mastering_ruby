# frozen_string_literal: true

# Steps
# divide input array into two halfs
# recursively sort each half
# merge two sorted halves into one sorted array

# Recursion is a technique where a function makes one or more calls to itself.
# And I am using recursion in merge_sort method.
# Visit this link to understand recursion
# https://www.rubyguides.com/2015/08/ruby-recursion-and-memoization/
#

def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  left = merge_sort(arr.take(mid))
  right = merge_sort(arr.drop(mid))

  merge(left, right)
end

def merge(left, right)
  puts "\nleft: #{left}, right: #{right}"
  sorted = []
  until left.empty? || right.empty?
    sorted << if left.first < right.first
                left.shift
              else
                right.shift
              end
  end

  result = sorted + left + right # just store it in a variable to print it
  puts "sorted: #{result}"
  result
end

puts "\nSorted array: #{merge_sort([3, 2, 1, 5, 4, 6, 7, 8, 9, 10]).join(' ')}"

# ----------------
# Output
# ----------------
# left: [5], right: [4]
# sorted: [4, 5]
#
# left: [1], right: [4, 5]
# sorted: [1, 4, 5]
#
# left: [2, 3], right: [1, 4, 5]
# sorted: [1, 2, 3, 4, 5]
#
# left: [6], right: [7]
# sorted: [6, 7]
#
# left: [9], right: [10]
# sorted: [9, 10]
#
# left: [8], right: [9, 10]
# sorted: [8, 9, 10]
#
# left: [6, 7], right: [8, 9, 10]
# sorted: [6, 7, 8, 9, 10]
#
# left: [1, 2, 3, 4, 5], right: [6, 7, 8, 9, 10]
# sorted: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#
# Sorted array: 1 2 3 4 5 6 7 8 9 10
#
# Above you can see how recursion works and in the end, you will get a sorted array.
#
#
# The time complexity of merge sort is O(n log n).
#
# One more example how recursion works in merge_sort method usinf CHATGPT
#
#      merge_sort([38, 27, 43, 3, 9, 82, 10])
#      ├── merge_sort([38, 27, 43])  -> Recursive call
#      │   ├── merge_sort([38])       -> Base case
#      │   └── merge_sort([27, 43])  -> Recursive call
#      │       ├── merge_sort([27])  -> Base case
#      │       └── merge_sort([43])  -> Base case
#      │   └── merge([27], [43]) -> Merge
#      └── merge_sort([3, 9, 82, 10]) -> Recursive call
#          ├── merge_sort([3, 9]) -> Recursive call
#          │   ├── merge_sort([3]) -> Base case
#          │   └── merge_sort([9]) -> Base case
#          │   └── merge([3], [9]) -> Merge
#          └── merge_sort([82, 10]) -> Recursive call
#              ├── merge_sort([82]) -> Base case
#              └── merge_sort([10]) -> Base case
#              └── merge([10], [82]) -> Merge
#      └── merge([27, 38, 43], [3, 9, 10, 82]) -> Final merge
# Merge Phase:
# Step 1: [27, 43] + [38] = [27, 38, 43]
# Step 2: [3, 9] + [10, 82] = [3, 9, 10, 82]
# Step 3: [27, 38, 43] + [3, 9, 10, 82] = [3, 9, 10, 27, 38, 43, 82]
# Final sorted array: [3, 9, 10, 27, 38, 43, 82]
