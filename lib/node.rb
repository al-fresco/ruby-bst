class Node
  attr_accessor :value, :left_child, :right_child

  include Comparable

  def initialize(value)
    @value = value
    @left_child = nil
    @right_child = nil
  end

  def <=>(other_node)
    @value <=> other_node.value
  end
end