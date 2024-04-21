# frozen_string_literal: true

# Board lol
class Board
  def initialize() end

  def comp_board(pieces = [['♙', [0, 0]], ['♙', [0, 7]]])
    arr = []
    (-7..0).each do |y|
      arr.push("\n")
      (0..7).each do |x| # x cordinates loadout
        piece = pieces.select { |data| data[1] == [x, y.abs] }[0] # this check if theres a match for xy
        piece = piece[0] unless piece.nil? # looks goofy but this gets the symbol
        piece = ((x + y) % 2).zero? ? bg_black(piece) : bg_white(piece) # first half tells which color for the BG
        arr.push(piece)
      end
      arr.push("\t")
    end
    arr.push("\n")
    arr.join('')
  end

  def bg_black(value)
    value = ' ' if value.nil?
    "\e[48;2;165;165;165m\e[30m#{value} \e[0m"
  end

  def bg_white(value)
    value = ' ' if value.nil?
    "\e[48;2;210;195;190m\e[30m#{value} \e[0m"
  end
end
