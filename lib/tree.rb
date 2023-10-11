require_relative './node.rb'
require 'pry-byebug'

class Tree
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array.uniq.sort)
  end

  def self.create_random(number_of_nodes = 10)
    Tree.new(Tree.make_array(number_of_nodes))
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(data, node = @root)
    if node == data
      puts "Data already exists within the tree."
    elsif node > data
      if node.left.nil?
        node.left = Node.new(data)
      else
        insert(data, node.left)
      end
    elsif node < data
      if node.right.nil?
        node.right = Node.new(data)
      else
        insert(data, node.right)
      end
    else
      puts "This data cannot be inserted."
    end
  end

  def find(data, node = @root)
    if node > data
      find(data, node.left)
    elsif node < data
      find(data, node.right)
    elsif node == data
      node
    else
      puts "Data does not exist within the tree."
    end
  end

  def delete(data, node = @root)
    if node > data
      node.left = delete(data, node.left)
    elsif node < data
      node.right = delete(data, node.right)
    else
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      successor = smallest_descendant_of(node.right)
      node.data = successor.data
      node.right = delete(successor.data, node.right)
    end
    
    node
  end

  private

  def build_tree(array)
    middle = array.length / 2

    node = Node.new(array[middle])

    unless middle == 0
      node.left = build_tree(array[0..middle - 1])
      node.right = build_tree(array[middle + 1..array.length - 1])
    end

    node
  end

  def smallest_descendant_of(node)
    if node.left.nil?
      node
    else
      smallest_descendant_of(node.left)
    end
  end

  def self.make_array(length, array = [])
    return array if array.length == length
    
    array << rand(100).to_i + 1
    make_array(length, array.uniq.sort)
  end
end