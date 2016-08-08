require "minitest/autorun"

class TestSimpleList < Minitest::Test

  class Node 
    def initialize(value)
      @value = value
      @next_node = nil
      @previous_node = nil
    end

     def initialize(value, previous_node)
      @value = value
      @next_node = nil
      @previous_node = :previous_node
    end

  end

  class List
    @node = nil

    def find(value)
      point_first
      find_from_beginning(@node, value)
      @node.value == value ? @node : nil
    end

    def find_from_beginning(value)
      @node.value != value && @node.next_node != nil  ? find(@node.next_node, value) : nilß
    end

    def point_first
      @node.previous_node == nil ? @node : point_first(@node.previous_node)
    end

    def point_last
      @node.next_node == nil ? @node : point_last(@node.next_node)
    end

    def add(value)
      firt_node? ? @node = Node.new(value) : add_node_to_list(value)     
    end

    def add_node_to_list(value)
      @node.next_node = Node.new(value, @node)
      @node = @node.next_node
    end

    def firt_node?(node)
      point_first
      node == @node ? true : false
    end

  end

# EMPEZAMOS LOS TEST

  def create_a_list
    @the_list = List.new
    @the_list.add('Primero')
    @the_list.add('Segundo')
    @the_list.add('Tercero')
    @the_list.add('Cuarto')
  end



  def find_recursive
    assert_equal('Tercero',find('Tercero'))
    assert_equal(nil ,find('Quinto'))
  end

  

end