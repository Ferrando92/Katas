class LyricsComposer
  def initialize
    @number_bottles = 99
  end

  def current_verse
    are_there_bottles? ? standar_verse : last_verse
  end

  def take_a_bottle
    @number_bottles -= 1
  end

  def word_classifier(number_bottles)
    number_bottles == 1 ? 'bottle' : 'bottles'
  end

  def bottles_count(number_bottles)
    number_bottles == 0 ? 'no more' : number_bottles
  end

  def are_there_bottles?
    @number_bottles != 0
  end

  def standar_verse
    firts_string = "#{@number_bottles} #{word_classifier(@number_bottles)} of beer on the wall, #{@number_bottles} #{word_classifier(@number_bottles)} of beer.\n"
    second_string = "Take one down and pass it around, #{bottles_count(@number_bottles - 1)} #{word_classifier(@number_bottles - 1)} of beer on the wall."
    firts_string + second_string
  end

  def last_verse
    firts_string = "No more bottles of beer on the wall, no more bottles of beer.\n"
    second_string = "Go to the store and buy some more, #{buy_99_bottles} #{word_classifier(@number_bottles)} of beer on the wall."
    firts_string + second_string
  end

  def buy_99_bottles
    @number_bottles = 99
  end
end

describe 'lyrics composer' do
  it 'starts with 99 bottles and returns the normal message' do
    song = LyricsComposer.new
    message = "99 bottles of beer on the wall, 99 bottles of beer.\nTake one down and pass it around, 98 bottles of beer on the wall."
    expect(song.current_verse).to eq message
  end

  it 'take a bottle and sing the next verse ' do
    song = LyricsComposer.new
    song.take_a_bottle
    message = "98 bottles of beer on the wall, 98 bottles of beer.\nTake one down and pass it around, 97 bottles of beer on the wall."
    expect(song.current_verse).to eq message
  end

  it 'when it has 2 bottles change the second_string of the current verse' do
    song = LyricsComposer.new
    97.times do
      song.take_a_bottle
    end
    message = "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall."
    expect(song.current_verse).to eq message
  end

  it 'when it has 1 bottles change the entire current verse' do
    song = LyricsComposer.new
    98.times do
      song.take_a_bottle
    end
    message = "1 bottle of beer on the wall, 1 bottle of beer.\nTake one down and pass it around, no more bottles of beer on the wall."
    expect(song.current_verse).to eq message
  end

  it '0 bottles case' do
    song = LyricsComposer.new
    99.times do
      song.take_a_bottle
    end
    message = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall."
    expect(song.current_verse).to eq message
  end
end
