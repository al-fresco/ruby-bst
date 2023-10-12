# frozen_string_literal: true

require_relative 'lib/tree'
require_relative 'lib/helpers'

# Creates tree; prints tree
tree = Tree.create_random(11)
tree.pretty_print

# Inserts 3 into the tree; prints tree
tree.insert(3)
tree.pretty_print

# Returns specified node
tree.find(3)

# Deletes inserted value from the tree; prints tree
tree.delete(3)
tree.pretty_print

# Passes nodes to a block in level order
puts "Level Order:\n"
tree.level_order { |node| print "#{node.data} " }
puts "\nPost Order:\n"
tree.postorder.each { |node| print "#{node.data} "}
