# frozen_string_literal: true

# AI GENERATED EXAMPLE
# The State Pattern allows an object to change its behavior dynamically based on its internal state.
# Use Case: Managing order statuses (pending, shipped, delivered) in an e-commerce app.

# Base State class
class OrderState
  def process
    raise NotImplementedError, 'Subclasses must implement `process`'
  end
end

# Concrete State: Pending
class PendingState < OrderState
  def process
    'Order is now Pending'
  end
end

# Concrete State: Shipped
class ShippedState < OrderState
  def process
    'Order has been Shipped'
  end
end

# Concrete State: Delivered
class DeliveredState < OrderState
  def process
    'Order has been Delivered'
  end
end

# Context (Order) managing state
class Order
  attr_accessor :state

  def initialize
    @state = PendingState.new
  end

  def change_state(new_state)
    @state = new_state
  end

  def process_order
    @state.process
  end
end

# ✅ Usage
order = Order.new
puts order.process_order  # Output: "Order is now Pending"

order.change_state(ShippedState.new)
puts order.process_order  # Output: "Order has been Shipped"

order.change_state(DeliveredState.new)
puts order.process_order  # Output: "Order has been Delivered"
