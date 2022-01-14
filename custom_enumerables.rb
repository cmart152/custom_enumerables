module Enumerable
  def my_each
    index = 0
    if block_given?
      self.length.times do 
        yield(self[index])
        index+=1
      end
      return self
    else
      return to_enum(:self)
    end
  end

  def my_each_with_index
    index = 0
    if block_given?
      self.length.times do 
        yield(self[index], index)
        index+=1
      end
      return self
    else
      return to_enum(:self)
    end
  end

  def my_select
    index = 0
    new_arr = []
    if block_given?
      self.length.times do 
        if yield(self[index]) then new_arr.push(self[index]) end
        index+=1
      end
      return new_arr
    else
      return to_enum(:self)
    end
  end

  def my_all?
    index = 0
    bool = true
    if block_given?
      self.length.times do 
        if yield(self[index]) && yield(self[index]) != nil
        index += 1
        else
          bool = false
          break
        end
      end
    else
      self.length.times do 
        if self[index] && self[index] != nil
          index += 1
        else
          bool = false
          break
        end
      end
    end
    return bool
  end

  def my_any?
    index = 0
    bool = false
    if block_given?
      self.length.times do 
        if yield(self[index]) && yield(self[index]) != nil
          bool = true
          break
        else
        index += 1
        end
      end
    else
      self.length.times do
        if self[index] && self[index] != nil
          bool = true
          break
        else
          index += 1
        end
      end
    end
    return bool
  end

  def my_none?
    index = 0
    bool = true
    if block_given?
      self.length.times do
        if yield(self[index]) && yield(self[index]) != nil
          bool = false
          break
        else
          index += 1
        end
      end
    else
      self.length.times do
        if self[index] && self[index] != nil
          bool = false
          break
        else 
          index += 1
        end
      end
    end
    return bool
  end

  def my_count(element = nil)
    index = 0
    total = 0
    if block_given?
      self.length.times do
        if yield(self[index])
          total += 1 
          index += 1
        else
          index += 1
        end
      end
    elsif element == nil
      total = self.length
    else
      self.length.times do
        if self[index] == element
          total += 1
          index += 1
        else
          index += 1
        end
      end
    end
    return total
  end

  def my_map(var = nil)
    index = 0
    new_arr = []

    if block_given? && var == nil
      self.length.times do 
        new_arr.push(yield(self[index]))
        index += 1
      end
    elsif block_given? && var.is_a?(Proc) || block_given? == false && var.is_a?(Proc)
      self.length.times do 
        new_arr.push(var.call(self[index]))
        index += 1
      end
    else
      return to_enum(:self)
    end
    return new_arr
  end

  def my_inject(memo = nil)
    index = 0
    self.length.times do
     
      if memo == nil
        memo = self[index]
        index += 1
        next
      end
      memo = yield(memo, self[index])
      index += 1
    end
    return memo
  end
end