require_relative 'lib/tree.rb'

arr = Array.new(10).map { |data| data = (rand * 100).to_i }

tree = Tree.new(arr)
tree.pretty_print

tree.delete(gets.chomp.to_i)

tree.pretty_print