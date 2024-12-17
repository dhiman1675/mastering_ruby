# frozen_string_literal: true

def partition_hash(hash)
  hash.partition { |_, value| value.odd? }.map(&:to_h)
end

def filter_hash(hash)
  hash.select { |_, value| value > 1 }
end

input = { a: 1, b: 2, c: 3, d: 4 }
puts "Hash after partition => #{partition_hash(input)}"
# Output: [{:a=>1, :c=>3}, {:b=>2, :d=>4}]

puts "Select pairs from hash => #{filter_hash(input)}"
# Output: {:b=>2, :c=>3, :d=>4}
