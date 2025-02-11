# frozen_string_literal: true

# AI GENERATED EXAMPLE
# The Memento Pattern is used to capture an object's state so that it can be restored
# later without exposing its internal structure.
# Use Case: Undo/Redo functionality (e.g., form rollback, document editing).

# The Memento stores state
class Memento
  attr_reader :state

  def initialize(state)
    @state = state.clone # Save deep copy of state
  end
end

# The Originator creates and restores mementos
class Document
  attr_accessor :content

  def initialize(content)
    @content = content
  end

  def save
    Memento.new(@content) # Save current state
  end

  def restore(memento)
    @content = memento.state # Restore state
  end
end

# The Caretaker manages mementos
class History
  def initialize
    @mementos = []
  end

  def add_memento(memento)
    @mementos.push(memento)
  end

  def get_memento(index)
    @mementos[index]
  end
end

# ✅ Usage
doc = Document.new('Hello World')
history = History.new

# Save initial state
history.add_memento(doc.save)

# Modify document
doc.content = 'Hello Ruby'
history.add_memento(doc.save)

# Modify again
doc.content = 'Hello Rails'

# Restore to the first version
doc.restore(history.get_memento(0))
puts doc.content # Output: "Hello World"
