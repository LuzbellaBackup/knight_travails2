# frozen_string_literal: true

# Main Framework
class Main
  def initialize
    load_libs
  end

  def load_libs
    require './lib/class/board'
    require './lib/class/piece'
  end

  private :load_libs

  def ui_unit(to_print)
    system('clear')
    print Board.new.comp_board([to_print])
    yield if block_given?
    gets
  end

  def cord_to_algnot(value, symbol = '')
    return unless value.is_a?(Array) && value.length == 2

    temp = (value[0] + 97).chr
    "#{symbol} #{temp}#{value[1]}"
  end

  def algnot_to_cord(string = '')
    return unless string.is_a?(String) && string.match(/[a-h][1-8]/)

    [(string[0].downcase.ord - 97), string[1].to_i]
  end
end

Game = Main.new

system('clear')
puts 'from b1 to g1'
prueba = Knight.new(0, '♞', [1, 0])
p prueba.options([6, 0])
options = prueba.options([6, 0]).map { |position| [prueba.symbol, position] }
gets
options.each do |option|
  Game.ui_unit(option) do
    puts Game.cord_to_algnot(option[1], option[0])
    puts "\n"
  end
end

p Game.algnot_to_cord('b5')
