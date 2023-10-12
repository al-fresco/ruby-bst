# frozen_string_literal: true

require_relative 'lib/tree'
require_relative 'lib/helpers'

tree = Tree.create_random(20)
tree.pretty_print

tree.insert(3)
tree.insert(10)
tree.insert(15)

tree.pretty_print
