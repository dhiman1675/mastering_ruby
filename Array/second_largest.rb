# frozen_string_literal: true

def second_largest(array)
  return nil if array.size < 2

  # l = largest, sl = second largest
  l = sl = 0
  array.each do |i|
    if i > l
      sl = l
      l = i
    elsif i > sl && i < l
      sl = i
    end
  end
  puts sl
end

array = [5, 2, 9, 1, 7, 6, 3] # o/p: 7
# array = [12, 9, 5, 342, 2] # o/p: 12
second_largest(array)
