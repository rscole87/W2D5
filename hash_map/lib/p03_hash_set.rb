class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key) #{:a => 3, :b => 4}
    i = key.hash % num_buckets
    if !include?(key)
      @store[i] << key
      @count += 1
      resize! if count == num_buckets 
    end
  end

  def include?(key) #{:a => 3, :b => 4}
    i = key.hash % num_buckets
    @store[i].each do |ele|
      if ele == key
        return true
      end 
    end
    false
  end

  def remove(key)
     i = key.hash % num_buckets
    if @store[i].include?(key)
      @store[i].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
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
