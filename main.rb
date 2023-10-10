require_relative 'lib/tree.rb'

test_array = Array.new(20).map { |data| data = (rand * 100).to_i }
p test_array

gets

tree = Tree.new(test_array)

tree.pretty_print

gets

puts "Enter insert value:"
tree.insert(73)
tree.insert(74)

tree.pretty_print