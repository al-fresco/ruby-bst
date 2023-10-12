# frozen_string_literal: true

# Represents a node in the tree; stores a value and references to its children
class Node
  include Comparable
  
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def <=>(other)
    if other.is_a?(Node)
      @data <=> other.data
    else
      @data <=> other
    end
  end
end
