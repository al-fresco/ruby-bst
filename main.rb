# frozen_string_literal: true

require_relative 'lib/tree'
require_relative 'lib/helpers'

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
tree.postorder.each { |node| print "#{node.data} "}

puts "\nIn Order Traversal:"
tree.inorder { |node| print "#{node.data} " }
