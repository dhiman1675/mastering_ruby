# frozen_string_literal: true

# Version1 : using a new array to store values
def selection_sort(arr)
  sorted_res = []
  while arr.size.positive?
    min_element = arr.min
    sorted_res << min_element
    arr.delete(min_element)
  end
  sorted_res.join(', ')
end

# Version2 : using the same array to store values
def selection_sort_v2(arr)
  n = arr.length
  (0...n).each do |i|
    min_index = i
    (i + 1...n).each do |j|
      min_index = j if arr[j] < arr[min_index]
    end
    arr[i], arr[min_index] = arr[min_index], arr[i] if min_index != i
  end
  arr.join(', ')
end

input = [9, 2, 1, 4, 3, 8]
input2 = [9, 2, 1, 4, 3, 8]
puts "V1: #{selection_sort(input)}"
puts "V2: #{selection_sort_v2(input2)}"

# NOTE
# selection_sort:
# ----------------
# Space Complexity: O(n)
# because requires additional space proportional to the input size,
# resulting in a space complexity of O(n).
# Time Complexity: O(n^2)
# ##################################################################
# selection_sort_v2:
# -------------------
# Space Complexity: O(1)
# Time Complexity: O(n^2)
