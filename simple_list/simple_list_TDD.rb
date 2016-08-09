require "minitest/autorun"

class TestSimpleList_TDD < Minitest::Test
	class List
		def add (value)
		end
		def find (value)
		end
	end


	describe List do #copypasted

    it "Return node from find value" do
      list = List.new
      sended=list.add("Quinto")
      returned_object = list.find("Quinto")

      returned_object.must_equal(sended)
    end
  end
end