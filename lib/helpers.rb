# frozen_string_literal: true

# Contains helpful methods to simplify code in Tree class
module Helpers
  def random_array(length = 10, array = [])
    return array if array.length == length
    
    array << rand(100).to_i + 1
    random_array(length, array.uniq.sort)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def smallest_descendant_of(node)
    if node.left.nil?
      node
    else
      smallest_descendant_of(node.left)
    end
  end
end