# frozen_string_literal: true

# In Ruby, the self keyword refers to the current object (or context) where the code is being executed.
# The behavior of self depends on where and how it is used.
#
# 1. Referencing the Current Object
# 2. Defining Class Methods
# 3. Accessing Class-Level Variables or Methods
# 4. Inside Class Definitions (for Context)
# 5. Avoiding Variable Shadowing
# 6. Inside Singleton Methods
# 7. When Including Modules
# 8. Self in Class << self (Eigenclass Context)
# 9. As a Return Value

# This class represents a demo.
class Example
  attr_reader :name

  @class_variable = '09122024'

  puts "Inside class: #{self}" # Use 4

  def initialize(name)
    @name = name
  end

  # Use 2, 3
  def self.getmy_class_variable
    puts class_variable
  end

  class << self
    attr_reader :class_variable
  end

  def new_name(new_name)
    @name = new_name
    self # (Use 9) Return the object for chaining
  end

  def show_name
    puts name # (Use 1) name = self.name
  end
end

Example.new('Rohit').new_name('New Name').show_name
Example.getmy_class_variable
