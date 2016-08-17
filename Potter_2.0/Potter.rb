require "minitest/autorun"

class TestPotter < Minitest::Test

  class Potter 

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
      final_price = apply_discounts(@basket)
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

  end 

  describe Potter do

    it "Gave an bunch of books and get them grouped by id" do
      #assert_equal({2 => 1}, Potter.group_books_by_id([2]))
      assert_equal({1 => 1 ,2 => 3}, Potter.group_books_by_id([2,2,2,1]))
      #assert_equal({3 => 1}, Potter.group_books_by_id([3]))
    end

    it "Gave the books grouped and get the collections, ready to apply the discount" do
      assert_equal([2,1,1],Potter.generate_basket)
    end

  end

=begin  #DEPRECATED
    class Test

    def self.price (arry)
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
      @basket = create_basket(arry)
      puts '----------'
      puts @basket
      puts '----------'
      apply_discounts()
    end

    def self.create_basket(books)
      basket = []
      books.each do |book|
        basket[book] == nil ? basket[book] = 1 : basket[book] = basket[book]+1
      end
    end

    def self.create_collections()
      @collection = []
      while @basket.size > 0
        iterator = @basket.size
        @basket.each.with_index do |book, i|
          @basket[i] = @basket[i]-1
         if @basket[i] <= 0 then
           @basket.delete_at(i)         	
         end
        end
        @collection.push(iterator)
      end
    end

    def self.apply_discounts ()
      @budget = 0
      create_collections
      @collection
    end
    
  end
	
=end

end