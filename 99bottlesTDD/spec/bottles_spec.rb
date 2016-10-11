class LyricsComposer
	attr_reader :number_bottles
	
	def initialize 
		@number_bottles = 99
	end

	def current_verse
		firts_string = "#{@number_bottles} bottles of beer on the wall, #{@number_bottles} bottles of beer.\n" 

		second_string = "Take one down and pass it around, #{@number_bottles - 1} bottles of beer on the wall."

		if @number_bottles == 2 
			second_string = "Take one down and pass it around, #{@number_bottles - 1} bottle of beer on the wall."
		elsif @number_bottles == 1 
			firts_string = "#{@number_bottles} bottle of beer on the wall, #{@number_bottles} bottle of beer.\n"
			second_string = "Take one down and pass it around, no more bottles of beer on the wall."
		end

		verse = firts_string + second_string
	end

	def take_a_bottle
		@number_bottles -= 1
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

end