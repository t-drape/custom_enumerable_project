module Enumerable
  # Your code goes here
  def my_all?
    self.my_each do |elem|
      return false if !yield(elem)
    end
    return true
  end

  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end
    return false
  end

  def my_count
    if block_given?
      count = 0
      self.my_each do |elem|
        count += 1 if yield(elem)
      end
      count
    else
      self.length
    end
  end

  def my_map
    arr = []
    self.my_each do |elem|
      arr << yield(elem)
    end
    arr
  end

  def my_none?
    self.my_each do |elem|
      return false if yield(elem)
    end
    return true
  end

  def my_select
    arr = []
    self.my_each do |elem|
      arr << elem if yield(elem)
    end
    arr
  end

  def my_each_with_index
    count = 0
    self.my_each do |elem|
      yield(elem, count)
      count += 1
    end
  end

  def my_inject(product)
    self.my_each do |elem|
      product = yield(product, elem)
    end
    product
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    # go through each element in array
    for i in self do
      yield(i)
    end
  end
end
