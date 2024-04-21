# frozen_string_literal: true

# Movement Data Struct
class Moves
  attr_reader :position, :parent

  attr_accessor :history

  def initialize(position, parent)
    @position = position
    @parent = parent
    @history = []
  end
end

# it'll probably be expanded later own
