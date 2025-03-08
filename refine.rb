# frozen_string_literal: true

# Monkey Patching in Ruby
# -> Monkey Patching refers to modifying or extending existing classes
#   (including built-in ones) at runtime.
#
# ⚠️ Problems with Monkey Patching
# 1. Overriding Core Functionality
# If a built-in method is changed, it may break existing behavior.
#
# 2. Hard to Debug
# If different gems modify the same class, debugging becomes difficult.
#
# ----------------------------------------------------------------------------
# Alternatives to Monkey Patching
# Refinements (Safer Alternative)
# Refinements allow scoped modifications instead of affecting the global class.

# using TitleizeRefinement ensures that the modification applies only within this scope,
# avoiding global conflicts.
module TitleizeRefinement
  refine String do
    def titleize
      split.map(&:capitalize).join(' ')
    end
  end
end

using TitleizeRefinement
puts 'hello world'.titleize # Output: "Hello World"
