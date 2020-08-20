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

  # def my_none?(arg = nil)
  #   if block_given?
  #     my_each { |i| return false if yield(i) == true}
  #   elsif arg.nil?
  #     my_each { |i| return true if i.nil? || i == false}
  #   elsif arg.is_a?(Regexp)
  #     my_each { |i| return false if i.match(arg) }
  #   elsif arg.is_a?(Class)
  #     my_each { |i| return false if i.is_a?(arg) }
  #   else
  #     my_each do |i|
  #       if i != arg
  #         return true
  #       elsif i == arg
  #         return false
  #       end
  #     end
  #   end
  #   true
  # end

  # def my_none?(arr = nil)
  #   Array(self).my_each do |arg|
  #     if !block_given?
  #       if arr.nil?
  #         next unless arg
  #       elsif arr.class == Class
  #         next unless arg.is_a? arr
  #       elsif arr.class == Regexp
  #         next unless arg =~ arr
  #       elsif (arg.is_a? Numeric) || (arg.is_a? String)
  #         next unless arg == arr
  #       end
  #     else
  #       next unless yield(arg)
  #     end
  #     return false
  #   end
  #   true
  # end


  # def my_none?(arg = false)
  #   if block_given?
  #     my_each { |x| return false if yield(x) == true }
  #     return true
  #   elsif arg.nil?
  #     my_each { |i| return true if i.nil? || i == false }
  #   elsif arg.is_a?(Regexp)
  #     my_each { |x| return false if x.match(arg) }
  #     return true
  #   else
  #     my_each { |i| return false if i == true }
  #   end
  #   true
  # end
  

end