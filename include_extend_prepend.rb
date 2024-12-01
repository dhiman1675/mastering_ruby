# Define a module with some methods
module Greetings
  def hello
    "Hello from Greetings!"
  end

  def goodbye
    "Goodbye from Greetings!"
  end
end

# Include Example
# The module's methods become instance methods in the class where the module is included.
class Person
  include Greetings

  def hello
    "Hello from Person!"
  end
end

# Extend Example
# The module's methods become class methods in the class where the module is extended.
class Animal
  extend Greetings
end

# Prepend Example
# The module's methods are added as instance methods, but they take precedence over the class's own methods.
class Robot
  prepend Greetings

  def hello
    "Hello from Robot!"
  end
end

# Demonstrating the include behavior
puts "Include Example:"
person = Person.new
puts person.hello    # Output: "Hello from Person!" (class method overrides included method)
puts person.goodbye  # Output: "Goodbye from Greetings!" (method from the module)

# Demonstrating the extend behavior
puts "\nExtend Example:"
puts Animal.hello    # Output: "Hello from Greetings!" (module method as class method)
puts Animal.goodbye  # Output: "Goodbye from Greetings!" (module method as class method)

# Demonstrating the prepend behavior
puts "\nPrepend Example:"
robot = Robot.new
puts robot.hello     # Output: "Hello from Greetings!" (prepended method overrides class method)
puts robot.goodbye   # Output: "Goodbye from Greetings!" (method from the module)

# Summary of key differences:
# - `include`: Adds module methods as instance methods of the class. The class's own methods take precedence.
# - `extend`: Adds module methods as class methods of the class.
# - `prepend`: Adds module methods as instance methods, but they override methods in the class itself.
