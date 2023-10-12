# frozen_string_literal: true

require_relative './node'
require_relative './helpers'
require_relative './traversal_methods'
require 'pry-byebug'

# Creates balanced binary search tree; manipulates and traverses nodes
class Tree
  extend Helpers::TreeClassMethods

  include Helpers::TreeInstanceMethods
  include Traversal

  attr_accessor :root

  def initialize(array)
    @root = build_tree(array.uniq.sort)
  end

  def self.create_random(number_of_nodes = 10)
    Tree.new(random_array(number_of_nodes))
  end

  def insert(data, node = @root)
    if node > data
      return node.left = Node.new(data) if node.left.nil?

      insert(data, node.left)
    elsif node < data
      return node.right = Node.new(data) if node.right.nil?

      insert(data, node.right)
    else
      puts 'This data cannot be inserted.'
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
      puts 'Data does not exist within the tree.'
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
    return nil if array.empty?
    return Node.new(array.first) if array == 1

    middle = array.length / 2
    node = Node.new(array[middle])

    node.left = build_tree(array.take(middle))
    node.right = build_tree(array.drop(middle + 1))

    node
  end
end
