require 'pry'
class Board 
  attr_accessor :cells 
  
  def initialize
    @cells = cells
    @cells = Array.new(9, " ")
  end
  
  def reset!
    @cells = Array.new(9, " ")
  end 
  
  def display 
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 
  
  def position(user_input)
    move = user_input.to_i - 1
    @cells[move]
  end 
  
  def full?
    !@cells.include?(" ")
  end 
  
  def turn_count 
    count = 0
    @cells.each do |i| 
      if i != " " 
        count += 1
      end 
    end
    count
  end 
  
  def taken?(input)
    #binding.pry
    position(input) != " " 
  end 
  
  def valid_move?(input)
    input = input.to_i
    input.between?(1,9) & !taken?(input)
  end 
  
  def update(input, player)
    input = input.to_i
    @cells[input-1] = player.token
  end 
end 