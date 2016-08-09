require "minitest/autorun"

class TestSimpleList_TDD < Minitest::Test
	class Node
		attr_reader :value, :previous_node, :next_node
		def initialize(value = nil, previous_node = nil, next_node=  nil)
			@value = value
			@next_node = next_node
			@previous_node = previous_node
		end

	end

	class List

		@node = Node.new(nil)

		def add (value)
			value
		end

		def find (value)
			value
		end

		def find_from_beginning(value)
		end

		def point_first
		end

		def point_last
		end

		def add_node_to_list(value)
		end

		def first_node(node)
			node.previous_node ? false : true
		end

		def last_node(node)
			node.next_node ? false : true
		end


	end


	describe List do 

    it "Return node from find value" do
      list = List.new
      sended=list.add("Quinto")
      returned_object = list.find("Quinto")
      returned_object.must_equal(sended)
    end

    it "create a Node and get the value" do
      node = Node.new(5)
      value = node.value
      value.must_equal(5)
    end

    it "create a Node and get the FULL info" do
      prev_node = Node.new(1)
      nex_node = Node.new(8)
      node = Node.new(2,prev_node,nex_node)
      value = node.value
      pre = node.previous_node
      nex = node.next_node
      value.must_equal(2)
      pre.value.must_equal(1)
      nex.value.must_equal(8)
    end

    it "Know if there is not previous node" do
      list=List.new
      prev_node = Node.new(1)
      nex_node = Node.new(8)
      node = Node.new(2,prev_node,nex_node)
      list.first_node(node).must_equal(false)
     
    end

     it "Know if there is not next node" do
      list=List.new
      prev_node = Node.new(1)
      nex_node = Node.new(8)
      node = Node.new(2,prev_node,nex_node)
      list.last_node(node).must_equal(false)
     
    end
     it "" do
     
    end

     it "" do
     
    end
  end
end