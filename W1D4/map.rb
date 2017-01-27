class Map

  def initialize(&prc)
    if !block_given?
      @block = lambda { return nil }
    else
      @block = prc
    end
    @ivar = []
  end

  def assign_value(key, value)
    @ivar.each_with_index do |el, idx|
      if el[0] == key
        @ivar[idx] = [key, value]
        return
      end
    end
    @ivar << [key, value]
  end

  def lookup(key)
    @ivar.each do |el|
      return el[1] if el[0] == key
    end
    @ivar << [key, @block.call]
  end

  def remove(key)
    arr = @ivar.dup
    @ivar.each_with_index do |el, idx|
      if el[0] == key
        arr.delete_at(idx)
        @ivar = arr
        return el[1]
      end
    end
    return nil
  end
end
