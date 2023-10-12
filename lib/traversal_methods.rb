# frozen_string_literal: true

# Contains several types of traversal methods for Tree objects
module Traversal
  def level_order(queue = [@root], visited = [], &block)
    if queue.empty?
      if block_given?
        visited.each { |node| block.call(node) }
      else
        visited
      end
    else
      node = queue.shift

      level_order(queue.push(node.left, node.right).compact, visited.push(node), &block)
    end
  end
end