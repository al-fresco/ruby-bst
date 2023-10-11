class Node
  attr_accessor :data, :left_child, :right_child

  include Comparable

  def initialize(data)
    @data = data
    @left_child = nil
    @right_child = nil
  end

  def <=>(other)
    if other.is_a?(Node)
      @data <=> other.data
    else
      @data <=> other
    end
  end

  def leaf?
    children.size == 0
  end

  def children
    [@left_child, @right_child].compact
  end
end