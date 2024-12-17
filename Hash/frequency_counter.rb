# frozen_string_literal: true

# Q: Given an array of integers, create a hash that counts the frequency of each number.
# Input: [1, 2, 2, 3, 3, 3]
# Output: { 1 => 1, 2 => 2, 3 => 3 }
input_arr = [1, 2, 2, 3, 3, 3]

# Versioin 1
resulted_hash = {}
input_arr.each do |i|
  resulted_hash[i] = resulted_hash.key?(i) ? (resulted_hash[i] + 1) : 1
end
puts "OUTPUT 1 => #{resulted_hash}"

# Version 2
# Hash.new(0) Creates a new hash where every non-existing key will have a default value of 0
resulted_hash2 = Hash.new(0)
input_arr.each { |i| resulted_hash2[i] += 1 }
puts "OUTPUT 2 => #{resulted_hash2}"

# Version 3
# combination of version 2 + each_with_object
def frequency_counter(array)
  array.each_with_object(Hash.new(0)) { |num, hash| hash[num] += 1 }
end
puts "OUTPUT 3 => #{frequency_counter(input_arr)}"
