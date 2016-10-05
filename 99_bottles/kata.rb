require 'test/unit'
class Bottles
  attr_reader :bottles_count
  def initialize
    @bottles_count = 99
    @song = ""
  end

  def sing_the_song
    until @bottles_count == 0 do
      take_a_bottle_and_sing
    end
    we_need_more_booze
    @song
  end

  def take_a_bottle_and_sing
   sing_count_prashe
   sing_take_one_prashe
   take_a_bottle
  end

  def take_a_bottle
    @bottles_count -= 1
  end

  def sing_count_prashe
    @song += "#{@bottles_count} bottles of beer on the wall, #{@bottles_count} bottles of beer. \n"
  end

  def sing_take_one_prashe
    @song += "Take one down, pass it around \n"
  end

  def we_need_more_booze
    @song +=  "No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more \n "
  end

end
class Test99Bottles < Test::Unit::TestCase
  def test_su
    @song = Bottles.new
    assert_equal(99, @song.bottles_count)
    puts @song.sing_the_song
  end
end