# frozen_string_literal: true

# Q: Reverse an Array Without Using Built-in Methods
def reverse_array(array)
  res = []
  array.map do |e|
    res.unshift(e)
  end
  res
end

puts reverse_array([1, 2, 3]) # [3, 2, 1]
