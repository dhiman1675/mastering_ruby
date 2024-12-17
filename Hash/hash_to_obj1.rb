# frozen_string_literal: true

require 'ostruct'

hash = { name: 'Alice', age: 25 }
obj = OpenStruct.new(hash)

puts obj
puts obj.name # Output: Alice
puts obj.age  # Output: 25
