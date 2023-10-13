# frozen_string_literal: true

# Contains helpful methods to simplify code in Tree class
module Helpers
  # Consists of methods usable by the Tree class (generally to assist in tree generation)
  module TreeClassMethods
    def random_array(length = 10, array = [])
      return array if array.length == length

      array << rand(100).to_i + 1
      random_array(length, array.uniq.sort)
    end

    def create_random(number_of_nodes = 10)
      self.new(random_array(number_of_nodes))
    end
  end

  # Consists of methods usable by instances of the Tree class (generally to perform smaller
  # functions on nodes to improve readability within the Tree class)
  module TreeInstanceMethods
    def pretty_print(node = @root, prefix = '', is_left = true)
      if node.right then pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) end
      puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
      if node.left then pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) end
    end

    def smallest_descendant_of(node)
      if node.left.nil?
        node
      else
        smallest_descendant_of(node.left)
      end
    end
  end
end
