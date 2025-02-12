# frozen_string_literal: true

# Q: Longest Substring Without Repeating Characters

def longest_unique_substring(str)
  res_arr = []
  res = ''
  str.chars.each do |c|
    res_arr << res

    res = res.chars.include?(c) ? c : res + c
  end
  res_arr.max_by(&:length)
end

puts longest_unique_substring('abcabcbb') # Output:  ("abc")
puts longest_unique_substring('bbbbb')    # Output:  ("b")
puts longest_unique_substring('pwwkew')   # Output: ("wke")
puts longest_unique_substring('abcdcef')  # Output: "abcd"

# Version 2 using AI
def longest_unique_substring_v2(str)
  char_index = {}  # Hash to store last seen positions of characters
  left = 0         # Left pointer of the window
  max_length = 0
  start_index = 0  # To track the start of the longest substring

  str.chars.each_with_index do |char, right|
    # If character is seen and within the window, move the left pointer
    left = char_index[char] + 1 if char_index.key?(char) && char_index[char] >= left

    # Update character index
    char_index[char] = right

    # Update max substring length
    if right - left + 1 > max_length
      max_length = right - left + 1
      start_index = left
    end
  end

  str[start_index, max_length]
end

puts '*******V2*******'
puts longest_unique_substring_v2('abcabcbb') # Output: "abc"
puts longest_unique_substring_v2('bbbbb')    # Output: "b"
puts longest_unique_substring_v2('pwwkew')   # Output: "wke"
puts longest_unique_substring_v2('abcdcef')  # Output: "abcd"

