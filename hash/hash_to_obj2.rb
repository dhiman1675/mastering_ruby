class HashObject
  def initialize(hash)
    hash.each do |key, value|
      define_singleton_method(key) { value }
    end
  end
end

hash = { name: "Bob", city: "New York" }
obj = HashObject.new(hash)

puts obj
puts obj.name # Output: Bob
puts obj.city # Output: New York
