require "minitest/autorun"

class TestSimpleList_TDD < Minitest::Test
	class Node
		attr_accessor :value, :previous_node, :next_node
		def initialize(value = nil, previous_node = nil, next_node=  nil)
			@value = value
			@next_node = next_node
			@previous_node = previous_node
		end

	end

	class List < Node

		def add (value)
			if @node then
				nuevo = Node.new(value,@node)
				@node.next_node = nuevo
				@node = nuevo
			else
			 	@node = Node.new(value)
			end
			@node
		end

		def find (value)
			point_first
		    find_from_beginning(value)
		    @node.value == value ? @node : nil
					
		end

		def find_from_beginning(value)
			if @node.value != value && @node.next_node != nil  then
			 	@node = @node.next_node
			 	find_from_beginning(value) 
			 else
			  	nil
			end
		end

		def point_first
			if @node.previous_node == nil then
		        @node 
		    else 
	    	    @node = @node.previous_node
		        point_first
		    end 
		end

		def point_last
		end

		def add_node_to_list(value)
		end

		def is_first_node(node)
			node.previous_node ? false : true
		end

		def is_last_node(node)
			node.next_node ? false : true
		end


	end


	describe List do 

    it "Return node from find or nil if is not at the list" do
      list = List.new
      list.add('1')
      list.add('2')
      list.add('4')
      sended=list.add("5")
      list.add('3')
      list.find("5").value.must_equal(sended.value)
      list.find("6").must_equal(nil)
    
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
      list = List.new
      prev_node = Node.new(1)
      nex_node = Node.new(8)
      node = Node.new(2,prev_node,nex_node)
      list.is_first_node(node).must_equal(false)
     
    end

     it "Know if there is not next node" do
      list = List.new
      prev_node = Node.new(1)
      nex_node = Node.new(8)
      node = Node.new(2,prev_node,nex_node)
      list.is_last_node(node).must_equal(false)
     
    end

     it "Return the previous and last Node added" do
     	 list = List.new
     	 fistro = list.add(5)
     	 secustro = list.add(8)
     	 fistro.next_node.must_equal(secustro)
     	 secustro.previous_node.must_equal(fistro)
     
    end

    it "" do
     
    end

    it "" do
     
    end

    it "" do
     
    end

     it "" do
     
    end

  end
end