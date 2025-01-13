# frozen_string_literal: true

require 'byebug'

# def quick_sort(arr)
#   length = arr.length
#   return arr if length <= 1

#   pivot = arr.delete_at(length - 1)
#   left, right = arr.partition { |x| x < pivot }

#   quick_sort(left) + [pivot] + quick_sort(right)
# end

def quick_sort(arr, depth = 0)
  # Simulate stack with indentation
  puts "#{'  ' * depth}Entering: quick_sort(#{arr})"

  length = arr.length
  if length <= 1
    puts "#{'  ' * depth}Base case reached: returning #{arr}"
    return arr
  end

  pivot = arr.delete_at(length - 1)
  left, right = arr.partition { |x| x < pivot }

  puts "#{'  ' * depth}Pivot: #{pivot} | Left: #{left} | Right: #{right}"

  # Recursive calls with depth incremented
  sorted_left = quick_sort(left, depth + 1)
  sorted_right = quick_sort(right, depth + 1)

  result = sorted_left + [pivot] + sorted_right

  puts "#{'  ' * depth}Returning: #{result} for quick_sort(#{arr + [pivot]}) <= RESULT"
  result
end

puts "Sorted Array: #{quick_sort([3, 2, 1, 5, 6, 4])}"

# OUTPUT
# Entering: quick_sort([3, 2, 1, 5, 6, 4])
# Pivot: 4 | Left: [3, 2, 1] | Right: [5, 6]
#   Entering: quick_sort([3, 2, 1])
#   Pivot: 1 | Left: [] | Right: [3, 2]
#     Entering: quick_sort([])
#     Base case reached: returning []
#     Entering: quick_sort([3, 2])
#     Pivot: 2 | Left: [] | Right: [3]
#       Entering: quick_sort([])
#       Base case reached: returning []
#       Entering: quick_sort([3])
#       Base case reached: returning [3]
#     Returning: [2, 3] for quick_sort([3, 2]) <= RESULT
#   Returning: [1, 2, 3] for quick_sort([3, 2, 1]) <= RESULT
#   Entering: quick_sort([5, 6])
#   Pivot: 6 | Left: [5] | Right: []
#     Entering: quick_sort([5])
#     Base case reached: returning [5]
#     Entering: quick_sort([])
#     Base case reached: returning []
#   Returning: [5, 6] for quick_sort([5, 6]) <= RESULT
# Returning: [1, 2, 3, 4, 5, 6] for quick_sort([3, 2, 1, 5, 6, 4]) <= RESULT
# Sorted Array: [1, 2, 3, 4, 5, 6]
