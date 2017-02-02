FISH = [
  'fish',
  'fiiish',
  'fiiiiish',
  'fiiiish',
  'fffish',
  'ffiiiiisshh',
  'fsh',
  'fiiiissshhhhhh'
]

def slug_oct
  longest = ""
  i = 0
  while i < FISH.length
    j = i + 1
    while j < FISH.length
      if FISH[j].length > FISH[i].length
        longest = FISH[j]
      else
        longest = FISH[i]
      end
      j += 1
    end
    i += 1
  end
  longest
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
    return self if length <= 1
    mid = count / 2
    sorted_left = self.take(mid).merge_sort(&prc)
    sorted_right = self.drop(mid).merge_sort(&prc)
    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged.concat(left)
    merged.concat(right)
    merged
  end
end

def clev_oct
  longest = ""
  FISH.each do |fish|
    longest = fish if fish.length > longest.length
  end
  longest
end


TILES = [
  "up",
  "right-up",
  "right",
  "right-down",
  "down",
  "left-down",
  "left",
  "left-up"
]

def slow_dance(dir, tiles_array)
  result = nil
  tiles_array.each_with_index do |tile, idx|
    result = idx if dir == tile
  end
  result
end

TILES_HASH = {
  "up" => 0,
    "right-up" => 1,
    "right" => 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(dir, tiles_hash)
  tiles_hash[dir]
end

puts slow_dance("up", TILES)
puts fast_dance("down", TILES_HASH)
