class Node
  attr_accessor :data, :left, :right

  include Comparable

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