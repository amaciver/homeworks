require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new()}
    place_stones
    @name1 = name1
    @name2 = name2
    @winner = nil
  end

  def place_stones
    (0..5).each { |i| @cups[i] += [:stone, :stone, :stone, :stone]}
    (7..12).each { |i| @cups[i] += [:stone, :stone, :stone, :stone]}
      # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1,6)
  end

  def make_move(start_pos, current_player_name)
    #debugger
    i = 1
    until @cups[start_pos].empty?
      unless current_player_name == @name1 && (start_pos + i) == 13 ||
             current_player_name == @name2 && (start_pos + i) == 6
        @cups[(start_pos + i)%14] << @cups[start_pos].pop
        ending_cup_idx = (start_pos + i)%14
      end
      i += 1
    end
    render
    next_turn(ending_cup_idx, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    #debugger
    unless ending_cup_idx == 6 && current_player_name == @name1 ||
           ending_cup_idx == 13 && current_player_name == @name2
       return :switch if @cups[ending_cup_idx].length == 1
     end
    return :prompt if ending_cup_idx == 6 && current_player_name == @name1
    return :prompt if ending_cup_idx == 13 && current_player_name == @name2
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].all? { |cup| cup.empty? } ||
       @cups[7..12].all? { |cup| cup.empty? }
       return true
    end
    return false
  end

  def winner
    case @cups[6].length <=> @cups[13].length
    when -1
      return @name2
    when 0
      return :draw
    when 1
      return @name1
    end
  end
end
