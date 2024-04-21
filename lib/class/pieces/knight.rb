# frozen_string_literal: true

# Knight Piece
class Knight < Piece
  attr_reader :symbol

  KNIGHT_MOVESET = [[1, 2], [-2, -1], [-1, 2], [2, -1],
                    [1, -2], [-2, 1], [-1, -2], [2, 1]].freeze

  # obj is objective cordinates
  def options(obj)
    # i know this is a mess that needs to get broken down into 2 or more methods.
    # i'll refactor it later

    queue = []
    c_node = Moves.new(@position, nil) # top parent
    history = []
    until c_node.position == obj
      (KNIGHT_MOVESET.map { |piece| [c_node.position[0] + piece[0], c_node.position[1] + piece[1]] }
      .keep_if { |option| table_limit(option) } # conditional
      .reject { |option| history.include?(option) } # conditional
      .map do |option|
        Moves.new(option, c_node)
      end.each do |child|
         history_elements = child.parent.history.map { |e| e } # yes this aint elegant but i havent found the 'exact'way
         child.history = history_elements
         child.history.push(child.parent.position)
         queue.push(child)
         history.push(child.position)
       end)
      c_node = queue.shift
    end
    c_node.history.push(c_node.position)
  end
end
