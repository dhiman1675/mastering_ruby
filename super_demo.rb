# frozen_string_literal: true

# parent
class Parent
  def greet(name)
    "Hello, #{name}!"
  end
end

# child
class Child < Parent
  def greet(name)
    super(name.upcase)
  end
end

child = Child.new
puts child.greet('Rohit') # Output: "Hello, ROHIT!"

# NOTES
# super() = No arguments passed
# But if you want to modify the arguments then you can use super()
# super =This will automatically passed the argument to the parent method
