require "minitest/autorun"

class TestSimpleList < Minitest::Test
  def test_empty_list_without_elements_returns_nil
    assert_nil List.new.fetch("Leo")
  end

  def test_can_add_things
    a_list = List.new

    a_list.add("Javi")

    fetched_node = a_list.fetch("Javi")
    assert_equal "Javi", fetched_node.value
  end

  Node = Struct.new(:value)
  class List

    def fetch(value)
      @node.value == value ? @node : nil
    end

    def add(value)
      @node = Node.new(value)
    end
  end
end