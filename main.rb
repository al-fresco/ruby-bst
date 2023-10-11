require_relative 'lib/tree.rb'

tree = Tree.create_random
tree.pretty_print

tree.insert(85)
p tree.find(85)

tree.pretty_print

tree.delete(85)

tree.pretty_print