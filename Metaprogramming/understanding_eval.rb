# frozen_string_literal: true

# Ruby provides powerful metaprogramming methods
# eval
# class_eval
# instance_eval
# which allow you to dynamically execute Ruby code at runtime.

# 1. eval – Evaluating Arbitrary Ruby Code
x = 10
p eval('x + 20', binding, __FILE__, __LINE__) # => 30

# Here I have Modify the eval call to include a binding (if needed) and
# the __FILE__ and __LINE__ arguments.

# binding: Captures the current scope (so x is accessible).
# __FILE__: Tells Ruby this code is "from" the current file.
# __LINE__: Pins the evaluation to the line where eval is called.

# Why I modify?
# Due to Robocop suggestion saying:
# --------------------------------------------------------
# Style/EvalWithLocation: Pass a binding, `__FILE__`, and `__LINE__` to `eval`.
#
# This offense is not autocorrectable.
# --------------------------------------------------------
# RuboCop can’t automatically fix this because it doesn’t know the intended
# binding or context for your eval call. The fix depends on your specific use case,
# so you need to manually adjust the code.

# 2. class_eval (or module_eval) – Evaluating Code Inside a Class
# Executes a block or string inside the context of a class or module.
# It modifies the class itself.
# Use Case: Adding or modifying methods in a class dynamically.

# Example: Defining a Method Inside a Class

class User; end

User.class_eval do
  def greet
    'Hello from class_eval!'
  end
end

user = User.new
puts user.greet # => "Hello from class_eval!"

# Example: Adding an Instance Variable

User.class_eval do
  def initialize(name)
    @name = name
  end

  attr_reader :name
end

user = User.new('Rohit')
puts user.name # => "Rohit"

# 3.instance_eval – Evaluating Code in an Object's Context
#  Executes a block or string in the context of a single object.
#  Modifies the instance, not the class.
#
# Use Case: Adding singleton methods to a specific instance.

user = Object.new

user.instance_eval do
  def greet
    'Hello from instance_eval!'
  end
end

puts user.greet # => "Hello from instance_eval!"

# NOTES
# eval – Executes arbitrary Ruby code as a string. ⚠️ Use with caution!
# class_eval – Modifies a class dynamically by adding instance methods.
# instance_eval – Modifies a single object by adding singleton methods.
