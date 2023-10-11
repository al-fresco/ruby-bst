# Adds helper methods to array class
class Array
  def median
    self.length / 2
  end

  def random(length = 10, array = [])
    return array if array.length == length
    
    array << rand(100).to_i + 1
    make_array(length, array.uniq.sort)
  end
end