module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?
    n = Array(self).length
    i = 0
    # You can use the times method insted while
    while i < n
      yield(Array(self)[i])
      i+=1
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    n = Array(self).length
    i = 0
    # You can use the times method insted while
    while i < n
      yield(Array(self)[i], i)
      i+=1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given? 
    result = []
    self.my_each do |i|
      next unless yield(i)
      result.push(i)
    end
    result
  end

end