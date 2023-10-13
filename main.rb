# frozen_string_literal: true

require_relative 'lib/tree'
require_relative 'lib/helpers'

# Contains methods related to random number generation (e.g. to test tree insertion)
module RandomData
  def random_num
    rand(100).to_i + 1
  end

  # Returns an array of length 'amount' of random integers between 1 and 100 that excludes
  # integers that are already represented in the tree
  def random_insertion_values(tree, amount = 5)
    tree_values = []
    tree.level_order { |node| tree_values << node.data }

    random_insertion_values = []
    until random_insertion_values.length == amount
      num = random_num
      random_insertion_values.push(num) unless tree_values.include?(num)
    end

    random_insertion_values.sort
  end
end

include RandomData

# Creates tree; prints tree
tree = Tree.create_random(15)
tree.pretty_print

# Inserts 3 into the tree; prints tree
tree.insert(3)
tree.pretty_print

# Returns specified node
node_at_3 = tree.find(3)

# Deletes inserted value from the tree; prints tree
tree.delete(3)
tree.pretty_print

# Traversing nodes in a tree using several different techniques:
puts 'Level Order Traversal:'
tree.level_order { |node| print "#{node.data} " }

puts "\nPost Order Traversal:"
tree.postorder.each { |node| print "#{node.data} " }

puts "\nIn Order Traversal:"
tree.inorder { |node| print "#{node.data} " }

puts "\nPre Order Traversal:"
tree.preorder { |node| print "#{node.data} " }

# Prints the height and depth of a randomly chosen node
random_node_data = tree.level_order.sample.data
puts "Depth: #{tree.depth_of(random_node_data)}"
puts "Height: #{tree.height_of(tree.find(random_node_data))}"

# Prints 'true' if the tree is balanced (i.e. height difference between left and right children
# is less than or equal to one); prints false if it is not
puts "Balanced: #{tree.balanced?}"

# Inserts 5 random integers into the tree; prints tree; prints if tree is balanced or not
insertions = random_insertion_values(tree)
tree.insert(insertions.pop) until insertions.empty?
tree.pretty_print
puts "Balanced: #{tree.balanced?}"

# Rebuilds tree from an array of its nodes to balance it; prints tree
tree.rebalance
tree.pretty_print
