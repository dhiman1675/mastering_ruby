# frozen_string_literal: true

def counting_sort_with_hash(arr)
  max = arr.max
  count_array = Array.new(max + 1, 0)

  arr.each { |num| count_array[num] += 1 }

  sorted = []
  max.times { |i| count_array[i].times { sorted << i } }
  sorted
end

# Example:
unsorted_array = [4, 2, 2, 8, 3, 3, 1]
puts counting_sort_with_hash(unsorted_array).inspect # => [1, 2, 2, 3, 3, 4, 8]
