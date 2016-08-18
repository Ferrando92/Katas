require "minitest/autorun"

class TestPotter < Minitest::Test

  class Potter #NEED TO REFACTOR TDD AND STUFF LIKE INSTANCES AND OTRER ATTR
    @groups_by_book = Hash.new
    @basket = Array.new
    @BOOK_PRICE = 8
    @DISCOUNTS = {
      1 => 1,
      2 => 0.95,
      3 => 0.9,
      4 => 0.85,
      5 => 0.8,
      6 => 0.7,
      7 => 0.55
    }
    attr_accessor :groups_by_book, :basket

    def self.price(books)
      group_books_by_id(books)
      generate_basket
      final_price = apply_discounts
      final_price
    end

    def self.group_books_by_id(books)
      books.each do |book_id|
        if !@groups_by_book[book_id] then
        	@groups_by_book[book_id] = 1 
        else 
   	    	@groups_by_book[book_id] = @groups_by_book[book_id]+1	
        end
      end
      @groups_by_book
    end

    def self.generate_basket
      while !@groups_by_book.empty?
  	    number_of_books_in_collection = 0
  	    @groups_by_book.each do |key, value|
  	      if @groups_by_book[key] == 1 then
  	        number_of_books_in_collection += 1
  	  	    @groups_by_book.delete(key)
  	      else
  	  	    number_of_books_in_collection += 1
  	  	    @groups_by_book[key] -= 1
  	      end
  	    end
  	    @basket.push(number_of_books_in_collection)
      end
      @basket
    end

    def self.apply_discounts
      final_price = 0
      @basket.each do |collection|
      	final_price += @DISCOUNTS[collection]*(collection*@BOOK_PRICE)
      end
      final_price	
    end
  end 

  describe Potter do

    it "Gave an bunch of books and get them grouped by id" do
      #assert_equal({2 => 1}, Potter.group_books_by_id([2]))
      #assert_equal({1 => 1 ,2 => 3}, Potter.group_books_by_id([2,2,2,1]))
      #assert_equal({3 => 1}, Potter.group_books_by_id([3]))
    end

    it "Gave the books grouped and get the collections, ready to apply the discount" do
      #assert_equal([2,1,1],Potter.generate_basket)
    end

    it 'Gave the collections and just have to apply the discounts ' do
	  #assert_equal(8*2 + 8 * 2 * 0.95, Potter.apply_discounts)  
	end  

	it 'Gave a bunch of books and get the price (full program)' do
	  assert_equal(61.6 ,Potter.price([1,1,1,2,2,3,4,4,7]))
	end	
  end
end


