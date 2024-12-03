def deep_merge(hash1, hash2)
  hash1.merge(hash2) do |_, old_val, new_val|
    old_val.is_a?(Hash) && new_val.is_a?(Hash) ? deep_merge(old_val, new_val) : new_val
  end
end

hash1 = { a: { b: 1, c: 2 }, d: 3 }
hash2 = { a: { b: 4, e: 5 }, f: 6 }

result = deep_merge(hash1, hash2)
puts result
# Output: {:a=>{:b=>4, :c=>2, :e=>5}, :d=>3, :f=>6}

puts"\nOutput without deep merging #{hash1.merge(hash2)}"