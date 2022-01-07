# frozen_string_literal: true

class Node
  attr_accessor :val, :next_node, :num

  def initialize(val = nil, num)
    @val = val
    @next_node = nil
    @num = num
  end

  def value(val)
    @val = val
  end

  def next_node_adder(val)
    @next_node = val
  end
end
