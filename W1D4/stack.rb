class Stack
    def initialize
      # create ivar to store stack here!
      @ivar = []
    end

    def add(el)
      # adds an element to the stack
      @ivar.push
    end

    def remove
      # removes one element from the stack
      @ivar.pop
    end

    def show
      # return a copy of the stack
      self
    end
  end
