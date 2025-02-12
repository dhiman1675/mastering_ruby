# frozen_string_literal: true

# Q: Given an array of words, group anagrams together.
# group_anagrams(["bat", "tab", "cat", "tac", "rat"])
# Output: [["bat", "tab"], ["cat", "tac"], ["rat"]]

words = %w[bat tab cat tac rat]

def group_anagrams(words)
  words.group_by { |word| word.chars.sort.join }.values
end

def group_anagrams_v2(words)
  anagram_groups = {}
  words.each do |word|
    sorted_word = word.chars.sort.join
    anagram_groups[sorted_word] ||= []
    anagram_groups[sorted_word] << word
  end

  anagram_groups.values
end

# anagram_groups = Hash.new([])
# Using Hash.new([]) won't work as expected because of how Ruby initializes default values in hashes.
# Hash.new([]) sets all missing keys to the SAME array.
# When you do anagram_groups[sorted_word] << word, you're modifying the same default array reference.
# But since no key was explicitly set in the hash, the changes don’t persist.
def group_anagrams_v3(words)
  anagram_groups = Hash.new { |h, k| h[k] = [] } # Ensures unique array per key

  words.each do |word|
    sorted_word = word.chars.sort.join
    anagram_groups[sorted_word] << word
  end

  anagram_groups.values
end

puts group_anagrams(words).inspect
puts group_anagrams_v2(words).inspect
p group_anagrams_v3(words)
