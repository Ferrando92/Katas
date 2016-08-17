require "minitest/autorun"

class TestSimpleList_TDD < Minitest::Test
  class Node 
  	def initialize (value, previous_node = nil, next_node = nil)
      @value = value
      @previous_node = previous_node
      @next_node = next_node
    end
  end
  describe Node do
    it 'Create a Node with just a value' do
    	assert_equal(Node.new,(node = Node.new(4)),"The node ar lesat need a value")
    	
    end 
  end
end