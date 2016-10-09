require "minitest/autorun"

class TestPotter < Minitest::Test

	class Test
		def self.price ()
		  arry = [0,1,2,3,2,1,2,3,1,2]
		  @BOOK_PRICE = 8
		  @DISCOUNTS = {
		  	0 => 1,
		  	1 => 0.95,
		  	2 => 0.9,
		  	3 => 0.8,
		  	4 => 0.75
		  }
		  @basket = create_basket(arry)
		  apply_discounts()
		end

		def self.create_basket(books)
		  basket = []
		  books.each do |book|
		    basket[book] == nil ? basket[book] = 1 : basket[book] = basket[book]+1
		  end
		  basket
		end

		def self.create_collections()
			@collection = []
			aux = @basket
			while aux != nil
				iterator = 0
				aux.each do |book|
					book -= 1
					iterator +=1 
					#debo borrar la posicion si llega a 0
				end
				@collection[iterator] != nil ? @collection[iterator] += 1 : @collection[iterator] =1 
			end

		end

		def self.apply_discounts ()
			@budget = 0
			create_collections
			puts @collection

		end

		price

	end

	#TEST

	def testBasics
	  assert_equal(0, price([]))
	  assert_equal(8, price([0]))
	  assert_equal(8, price([1]))
	  assert_equal(8, price([2]))
	  assert_equal(8, price([3]))
	  assert_equal(8, price([4]))
	  assert_equal(8 * 2, price([0, 0]))
	  assert_equal(8 * 3, price([1, 1, 1]))
	end

	def testSimpleDiscounts
	  assert_equal(8 * 2 * 0.95, price([0, 1]))
	  assert_equal(8 * 3 * 0.9, price([0, 2, 4]))
	  assert_equal(8 * 4 * 0.8, price([0, 1, 2, 4]))
	  assert_equal(8 * 5 * 0.75, price([0, 1, 2, 3, 4]))
	end

	def testSeveralDiscounts
	  assert_equal(8 + (8 * 2 * 0.95), price([0, 0, 1]))
	  assert_equal(2 * (8 * 2 * 0.95), price([0, 0, 1, 1]))
	  assert_equal((8 * 4 * 0.8) + (8 * 2 * 0.95), price([0, 0, 1, 2, 2, 3]))
	  assert_equal(8 + (8 * 5 * 0.75), price([0, 1, 1, 2, 3, 4]))
	end

	def testEdgeCases
	  assert_equal(2 * (8 * 4 * 0.8), price([0, 0, 1, 1, 2, 2, 3, 4]))
	  assert_equal(3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8), 
	    price([0, 0, 0, 0, 0, 
	           1, 1, 1, 1, 1, 
	           2, 2, 2, 2, 
	           3, 3, 3, 3, 3, 
	           4, 4, 4, 4]))
	end
end
