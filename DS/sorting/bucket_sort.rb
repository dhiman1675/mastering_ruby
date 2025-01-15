# frozen_string_literal: true

def bucket_sort(arr)
  return arr if arr.empty?

  # Create empty buckets
  bucket_count = Math.sqrt(arr.size).to_i
  buckets = Array.new(bucket_count) { [] }

  # Determine the range of each bucket
  min_value = arr.min
  max_value = arr.max
  range = (max_value - min_value) / bucket_count.to_f

  # Distribute array elements into buckets
  arr.each do |num|
    index = ((num - min_value) / range).to_i
    index = bucket_count - 1 if index == bucket_count # Edge case for max value
    buckets[index] << num
  end

  # Sort each bucket and concatenate the result
  sorted_array = []
  buckets.each do |bucket|
    sorted_array.concat(bucket.sort)
  end

  sorted_array
end

# Example usage
arr = [0.42, 0.32, 0.23, 0.52, 0.25, 0.47, 0.51]
sorted_arr = bucket_sort(arr)
puts "Sorted array: #{sorted_arr}"
