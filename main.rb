require_relative 'lib/tree.rb'

test_array = Array.new(20).map { |data| data = (rand * 100).to_i }

tree = Tree.new(test_array)
tree.pretty_print

tree.insert(55)
tree.pretty_print

p tree.find(55)
