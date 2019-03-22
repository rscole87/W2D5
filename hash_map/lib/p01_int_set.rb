require 'byebug'

class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
      raise "Out of bounds" if num < 0 || num > @store.length
      @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
    # return true if @store[num] = true 
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % 20
    @store[i] << num 
  end

  def remove(num)
    i = num % 20
    @store[i].delete(num)
  end

  def include?(num)
    i = num % 20
      @store[i].each do |ele|
      if ele == num
        return true
      end 
      end
      false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    i = num % num_buckets
    if !@store[i].include?(num)
      @store[i] << num 
      @count += 1
      resize! if count == num_buckets 
    end
  end

  def remove(num)
    i = num % num_buckets
    if @store[i].include?(num)
      @store[i].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    i = num % num_buckets
    @store[i].each do |ele|
      if ele == num
        return true
      end 
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    set_eles = @store.flatten
    @count = 0
    @store = Array.new(@store.length * 2) { Array.new }
    set_eles.each { |ele| insert(ele) }
  end
end
