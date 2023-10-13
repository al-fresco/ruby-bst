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
    if queue.compact.empty?
      return block_given? ? nil : read
    end

    node = queue.shift
    block.call(node) if block_given?
    
    queue << node.left
    queue << node.right

    level_order(queue.compact, read.push(node), &block)
  end

  def preorder(node = @root, read = [], &block)
    read.push(node)
    read = preorder(node.left, read) unless node.left.nil?
    read = preorder(node.right, read) unless node.right.nil?

    if block_given?
      read.each { |node| block.call(node) }
    else
      read
    end
  end

  def inorder(node = @root, read = [], &block)
    read = inorder(node.left, read) unless node.left.nil?
    read.push(node)
    read = inorder(node.right, read) unless node.right.nil?

    if block_given?
      read.each { |node| block.call(node) }
    else
      read
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