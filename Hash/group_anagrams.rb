# frozen_string_literal: true

# Q:Given an array of strings, group the anagrams together in a hash.
# Input: ["eat", "tea", "tan", "ate", "nat", "bat"]
# Output: {{["eat", "tea", "ate"]=>3, ["tan", "nat"]=>2, ["bat"]=>1}

def group_anagrams(words)
  anagram_groups = Hash.new { |hash, key| hash[key] = [] }
  words.each do |word|
    sorted_word = word.chars.sort.join
    anagram_groups[sorted_word] << word
  end

  # anagram_group = {"aet"=>["eat", "tea", "ate"], "ant"=>["tan", "nat"], "abt"=>["bat"]}
  # Transform grouped anagrams into desired output format
  output = {}
  anagram_groups.each_value do |group|
    output[group] = group.size
  end

  output
end

# Test Input
input = %w[eat tea tan ate nat bat]
puts group_anagrams(input)
# Output: {["eat", "tea", "ate"]=>3, ["tan", "nat"]=>2, ["bat"]=>1}
