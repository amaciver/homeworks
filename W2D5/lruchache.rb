class LRUCache
  def initialize(size)
    @lru = Array.new(size)
  end

  # returns number of elements currently in cache
  def count
    count = 0
    @lru.each do |el|
      count += 1 unless el == nil
    end
    count
  end

  # adds element to cache according to LRU principle
  def add(el)
    if @lru.include?(el)
      update_cache(el, @lru.index(el))
    else
      shift_cache(el)
    end
  end

  # shows the items in the cache, with the LRU item first
  def show
    p @lru
  end

  # helper methods go here!
  private
  def update_cache(el, idx)
    @lru.delete_at(idx)
    @lru.push(el)
  end

  def shift_cache(el)
    @lru.shift
    @lru.push(el)
  end
end


johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

puts johnny_cache.count == 2 # => returns 2

johnny_cache.add([1,2,3])

puts johnny_cache.count ==  3

johnny_cache.add(5)
johnny_cache.add(-5)

puts johnny_cache.count == 4

johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])

puts johnny_cache.count == 4

johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

puts johnny_cache.show ==
      [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
