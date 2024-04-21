# frozen_string_literal: true

# Piece
class Piece
  attr_accessor :position, :symbol, :childs

  def self.load_libs
    require './lib/class/move'
    require './lib/class/pieces/knight'
  end

  def initialize(color = 0, symbol = '♙', position = nil)
    @color = color
    @position = position
    @symbol = symbol
    # @struct = Moves.new(@position, nil) // i wont delete this yet because im not sure if ill use it later
    @childs = []
  end

  def info
    [@symbol, @position]
  end

  def table_limit(pos)
    (pos[0] > -1 && pos[0] < 8) && (pos[1] > -1 && pos[1] < 8)
  end

  # Yes i know this shouldnt go here yet since no pawn.rb has been implemented.
  # it will be added once i start the chess.rb project
  def create_pawns
    pieces = []
    8.times do |i|
      pieces.push ['♙', [i, 1]]
    end
    8.times do |i|
      pieces.push ['♟', [i, 6]]
    end
    pieces
  end

  # private :load_libs // Security Levels must be addressed
end

Piece.load_libs
