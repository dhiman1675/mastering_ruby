# frozen_string_literal: true

def palindrome?(str)
  str == reverse_string(str)
end

def reverse_string(str)
  result = ''
  str.each_char { |char| result = char + result }
  result
end

puts palindrome?('racecar')  # => true
puts palindrome?('hello')    # => false

def count_vowels(str)
  vowels = %w[a e u i o]
end
