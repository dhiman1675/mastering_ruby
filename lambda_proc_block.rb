# Summary of Key Differences:
puts "\nSummary of Differences:"
puts <<-EOS
1. **Block**:
   - Not an object; it’s an anonymous chunk of code passed to a method.
   - Use `yield` to invoke it.
   - Cannot be stored or passed around like a lambda or proc.

2. **Lambda**:
   - A lambda is a way to define a block & its parameters with some special syntax.
   - An instance of Proc.
   - Stricter argument checking.
   - Return inside a lambda exits the lambda itself, not the enclosing method.

3. **Proc**:
   - Looser argument checking.
   - Return inside a proc exits the enclosing method.

NOTE: enclosing method means method from which proc or lambda called

EOS

=begin
Q: Encapsulating Blocks of Code
Encapsulation of blocks of code means wrapping a piece of executable logic (code)
into an object (like a Proc or Lambda) that can be stored in a variable,
passed as an argument to methods, or invoked later. This makes the code reusable,
composable, and manageable in a dynamic way.
=end

# Block Example
# A block is an anonymous chunk of code passed to a method.
def block_example
  puts "Before yielding to the block"
  yield if block_given? # Calls the block passed to the method
  puts "After yielding to the block"
end

puts "Block Example:"
block_example { puts "Hello from the block!" }
# Output:
# Before yielding to the block
# Hello from the block!
# After yielding to the block

# Lambda Example
# A lambda is an instance of the Proc class but has stricter argument checking and behaves more like a method.
lambda_example = lambda { |x| "Hello, #{x}!" }

puts "\nLambda Example:"
puts lambda_example.call("Lambda") # Output: Hello, Lambda!
# Uncommenting the line below will raise an ArgumentError because lambdas enforce argument count strictly.
# puts lambda_example.call

# Proc Example
# A proc is similar to a lambda but with looser argument checking and different return behavior.
proc_example = Proc.new { |x| "Hello, #{x || 'World'}!" }

puts "\nProc Example:"
puts proc_example.call("Proc")  # Output: Hello, Proc!
puts proc_example.call          # Output: Hello, World! (missing arguments default to nil)

# Key Behavioral Differences

# Return behavior: Lambda vs Proc
def return_behavior_example
  lambda_fn = lambda { return "Return from lambda" }
  proc_fn = Proc.new { return "Return from proc" }

  puts "Lambda return example:"
  result = lambda_fn.call
  puts result # This line is executed because lambdas don't exit the enclosing method.

  puts "\nProc return example:"
  result = proc_fn.call
    # The Proc causes the enclosing method to return, so this line won't execute.
end

return_behavior_example