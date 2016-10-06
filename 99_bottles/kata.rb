require 'test/unit'
class BottlesSong
  attr_reader :bottles_count

  def initialize(innitial_number_of_bottles)
    @bottles_count = innitial_number_of_bottles
    @song = ''
  end

  def sing_the_song
    create_the_song
  end

  def create_the_song
    until @bottles_count <= 0
      take_a_bottle_and_sing
    end
    we_need_more_booze
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
    @song += "No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more \n "
  end
end

class Test99Bottles < Test::Unit::TestCase
  def setup
    @song = BottlesSong.new(99)
  end

  def test_take_one
    assert_equal(98, @song.take_a_bottle)
  end

  def test_sing_song
    # puts @song.sing_the_song
  end

  def test_no_bottles
    song = BottlesSong.new(-1)
    expected = "No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more \n "
    assert_equal(expected, song.sing_the_song)
  end
end
