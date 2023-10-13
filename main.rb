# frozen_string_literal: true

require_relative 'lib/tree'
require_relative 'lib/helpers'

# Creates tree; prints tree
tree = Tree.create_random(100)
tree.pretty_print

# Traversing nodes in a tree using several different techniques:
puts 'Level Order Traversal:'
tree.level_order { |node| print "#{node.data} " }
print "\n"

puts "\n\nPost Order Traversal:"
tree.postorder.each { |node| print "#{node.data} " }
print "\n"

puts "\n\nIn Order Traversal:"
tree.inorder { |node| print "#{node.data} " }
print "\n"

puts "\n\nPre Order Traversal:"
tree.preorder { |node| print "#{node.data} " }
print "\n"

# Prints the height and depth of a randomly chosen node
random_node_data = tree.level_order.sample.data
puts "Depth of #{random_node_data}: #{tree.depth_of(random_node_data)}"
puts "Height of #{random_node_data}: #{tree.height_of(tree.find(random_node_data))}"

# Prints 'true' if the tree is balanced (i.e. height difference between left and right children
# is less than or equal to one); prints false if it is not
puts "Balanced: #{tree.balanced?}"
puts "Node total: #{tree.level_order.size}"

# Rebuilds tree from an array of its nodes to balance it; checks balance (should always return true);
# prints tree
tree.rebalance
tree.pretty_print
puts "Balanced: #{tree.balanced?}"
puts "Node total: #{tree.level_order.size}"
