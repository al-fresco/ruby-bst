# frozen_string_literal: true

require_relative 'lib/tree.rb'
require_relative 'lib/helpers.rb'

tree = Tree.create_random(20)
tree.pretty_print
p tree.root