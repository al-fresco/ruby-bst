require_relative 'node.rb'

class Tree
  attr_reader :root

  def initialize(array)
    @root = build_tree(array.uniq.sort)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end

  private

  def build_tree(array)
    mid = array.length / 2
    root = Node.new(array[mid])

    unless mid == 0
      root.left_child = build_tree(array[0..mid - 1])
      root.right_child = build_tree(array[mid + 1..-1])
    end

    root
  end
end