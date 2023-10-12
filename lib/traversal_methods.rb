# frozen_string_literal: true

# Contains several types of traversal methods for Tree objects
module Traversal
  def smallest_descendant_of(node)
    if node.left.nil?
      node
    else
      smallest_descendant_of(node.left)
    end
  end

  def level_order(queue = [@root], read = [], &block)
    if queue.empty?
      if block_given?
        read.each { |node| block.call(node) }
      else
        read
      end
    else
      node = queue.shift

      level_order(queue.push(node.left, node.right).compact, read.push(node), &block)
    end
  end

  def postorder(node = @root, read = [], &block)
    read = postorder(node.left, read) unless node.left.nil?
    read = postorder(node.right, read) unless node.right.nil?
      
    if block_given?
      read.each { |node| block.call(node) }
    else
      read.push(node)
    end
  end
end