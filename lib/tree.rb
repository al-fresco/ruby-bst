require_relative 'node.rb'

class Tree
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array.uniq.sort)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end

  def insert(data, node = @root)
    case node <=> data
    when 0
      "Data already exists within the tree."
    when 1
      if node.left_child.nil?
        node.left_child = Node.new(data)
      else
        insert(data, node.left_child)
      end
    when -1
      if node.right_child.nil?
        node.right_child = Node.new(data)
      else
        insert(data, node.right_child)
      end
    end
  end

  def find(data, node = @root)
    return "Data does not exist within the tree." if node.nil?

    case node <=> data
    when 1
      find(data, node.left_child)
    when -1
      find(data, node.right_child)
    when 0
      node
    end
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