require "minitest/autorun"

class TestSimpleList < Minitest::Test

  class Node 
    
    attr_accessor  :value
    attr_accessor  :next_node
    attr_accessor  :previous_node

    def initialize(value = nil, previous_node = nil, next_node = nil)
      @value = value
      @next_node = next_node
      @previous_node = previous_node
    end

  end

  class List

    @node = Node.new(nil)

    def find(value)
      point_first
      find_from_beginning(@node, value)
      @node.value == value ? @node : nil
    end

    def find_from_beginning(value)
      @node.value != value && @node.next_node != nil  ? find(@node.next_node, value) : nilß
    end

    def point_first
      #@node.previous_node == nil ? @node : (point_first ,@node = @node.previous_node)
      if @node.previous_node == nil then
         @node 
      else 
        @node = @node.previous_node
        point_first
      end 
    end

    def point_last
      if @node.next_node == nil then
         @node 
      else 
        @node = @node.next_node
        point_last
      end 
    end

    def add(value)
      firt_node(@node) ? @node = Node.new(value) : add_node_to_list(value)     
    end

    def add_node_to_list(value)
      point_last
      @node.next_node = Node.new(value, @node)
      @node = @node.next_node
    end

    def firt_node(node)
      point_first
      node == @node ? true : false
    end

  end

# EMPEZAMOS LOS TEST

  describe List do #copypasted

    it "Return node from find value" do
      list = List.new
      sended=list.add("Quinto")
      returned_object = list.find("Quinto")

      expect(returned_object).to eq(sended)
    end

  end

end