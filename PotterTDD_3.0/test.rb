
class TestPotter < Test::Unit::TestCase
  def setup
  end

  def test_each_book_cost_eight
    assert_equal(8, get_bill(:book))
  end
end
