require "minitest/autorun"

class TestSimpleList_TDD < Minitest::Test
  class Node 
  	def initialize (value, previous_node = nil, next_node = nil)
      @value = value
      @previous_node = previous_node
      @next_node = next_node
    end

    def have_next_node?
      @next_node ? true : false
    end

    def have_previous_node?
      @previous_node ? true : false
    end
    
    def set_value(value)
      @value = value
    end

    def set_previous_node(node)
      @previous_node = node
    end

    def set_next_node(node)
      @next_node = node
    end

    def get_value
      @value
    end

    def get_previous_node
      @previous_node
    end

    def get_next_node
      @next_node
    end

  end

  class List
    def initialize
      @head
      @tale
    end

    def add_node (value)
      if @head == nil
        node = Node.new(value)
        @head = node
        @tale = node
      elsif @head == @tale
        node = Node.new(value,@head)
        @head.set_next_node(node)
        @tale = node
      else
        node = Node.new(value,@tale)
        @tale.set_next_node(node)
        @tale = node                
      end
    end

    def find (value)
      result = false
      result = find_from_beginning(value,@head)
      result        
    end

    def find_from_beginning(value,node)
      if node.get_value == value 
        return node
      end
      if node.have_next_node? #also node != @tale
        find_from_beginning(value, node.get_next_node)
      else
        false
      end
    end 
    def delete_node (value)
      node_to_delete = find(value)
      previous_node = node_to_delete.get_previous_node
      next_node = node_to_delete.get_next_node
      previous_node.set_next_node(next_node)
      next_node.set_previous_node(previous_node)      
    end

  end
 
  describe List do
    it 'Find a value previously added' do #Should do a setup method
      list = List.new
      list.add_node(1)
      list.add_node(2)
      list.add_node(3)
      list.add_node(4)
      node = list.add_node(9)
      list.add_node(5)
      assert_equal(node, list.find(9))
    end
    it 'Delete a value previously added' do #Should do a setup method
      list = List.new
      list.add_node(1)
      list.add_node(2)
      list.add_node(3)
      list.add_node(4)
      list.add_node(9)
      list.add_node(5)
      list.delete_node(9)
      assert_equal(false, list.find(9))
    end
    it 'Delete the head' do #Should do a setup method
      list = List.new
      list.add_node(1)
      list.add_node(2)
      list.add_node(3)
      list.add_node(4)
      list.add_node(9)
      list.add_node(5)
      list.delete_node(5)
      assert_equal(false, list.find(5))
    end
    it 'Delete the tale' do #Should do a setup method
      list = List.new
      list.add_node(1)
      list.add_node(2)
      list.add_node(3)
      list.add_node(4)
      list.add_node(9)
      list.add_node(5)
      list.delete_node(1)
      assert_equal(false, list.find(1))
    end

    it 'Delete head and tale, add a few nodes and find them' do #Should do a setup method
      list = List.new
      list.add_node(1)
      list.delete_node(1)
      node1 = list.add_node(2)
      node2 = list.add_node(4)
      assert_equal(node1, list.find(2))
      assert_equal(node2, list.find(4))
    end
  end
end