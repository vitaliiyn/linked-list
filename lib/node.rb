class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end

  def to_s
    "Node: #{@value}"
  end
end