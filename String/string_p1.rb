# frozen_String_literal: true

# Need to reverse the chars but special charactor should not be changed
# input = 'A__&&BJH##'
# output = "H__&&JBA##"

def reverse(str)
  reversed_chars = str.gsub(/[^a-zA-Z]/, '').chars.reverse
  res = str.chars
  res.each_with_index do |c, i|
    res[i] = reversed_chars.shift if c.match?(/[a-zA-Z]/)
  end
  res.join('')
end

@is_char = ->(c) { ('a'..'z').include?(c.downcase) }

def reverse_without_regex(str)
  str_arr = str.split('')
  chars = str_arr.select { |c| @is_char.call(c.downcase) }.reverse
  str_arr.each_with_index do |c, i|
    str_arr[i] = chars.shift if @is_char.call(c.downcase)
  end
  str_arr.join('')
end

# upgraded version of reverse using AI
def reverse_only_chars(str)
  reversed_chars = str_arr.scan(/[a-zA-Z]/).reverse
  result = str.chars.map do |char|
    if char.match?(/[a-zA-Z]/)
      reversed_chars.shift
    else
      char
    end
  end

  result.join
end

input1 = 'A__&&BJH##'
puts reverse(input1)
puts reverse_without_regex(input1)
puts reverse_only_chars(input1)
