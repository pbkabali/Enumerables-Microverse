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

  def my_all?
    #something
  end

  def my_any?(arg = true)
    if block_given?
      my_each { |i| return true if yield(i) == true }
    elsif arg.is_a?(Class)
      my_each { |i| return true if i.is_a?(arg) }
    elsif arg.nil?
      my_each { |i| return true if i.nil? || i == false }
    elsif arg.is_a?(Regexp)
      my_each { |i| return true if i.match(arg) }
    else
      my_each { |i| return true if i == arg }
    end
    false
  end

  def my_none?(arg = true)
    if block_given?
      my_each { |i| return }
    end
    true
  end

end