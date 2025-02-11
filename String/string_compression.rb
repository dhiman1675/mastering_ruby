# frozen_string_literal: true

# Q: Problem: Given a string "aaabbccccd", compress it to "a3b2c4d1".

str = 'aaabbccccd'
res = Hash.new(0)
str.chars.each do |c|
  res[c] += 1
end
res_str = ''
res.each do |k, v|
  res_str = res_str + k + v.to_s
end

puts res_str

# Approch 2
res_str = ''
count = 1

(1...str.length).each do |i|
  if str[i] == str[i - 1]
    count += 1
  else
    res_str = res_str + str[i - 1] + count.to_s
    count = 1
  end
end

# Append the last character and its count
res_str = res_str + str[-1] + count.to_s

puts res_str
