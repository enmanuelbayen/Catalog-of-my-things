require_relative '../classes/genre' # Adjust the path accordingly
RSpec.describe Genre do
  let(:dummy_item) { double('item') }
  describe '#initialize' do
    it 'initializes a genre object with name and optional id' do
      genre = Genre.new('Fiction', 123)
      expect(genre.name).to eq('Fiction')
      expect(genre.id).to eq(123)
    end
    it 'generates a random id if not provided' do
      allow(SecureRandom).to receive(:random_number).with(1..1000).and_return(456)
      genre = Genre.new('Fantasy')
      expect(genre.id).to eq(456)
    end
  end
  describe '#add_item' do
    it 'adds an item to the genre' do
      genre = Genre.new('Fiction')
      allow(dummy_item).to receive(:add_genre)
      genre.add_item(dummy_item)
      expect(genre.items).to include(dummy_item)
    end
  end
  describe '.list_all_genres' do
    it 'lists all genres' do
      genres = [
        Genre.new('Fiction', 123),
        Genre.new('Fantasy', 456)
      ]
      expect { Genre.list_all_genres(genres) }.to output(/Fiction.*Fantasy/m).to_stdout
    end
    it 'outputs a message for empty genre list' do
      genres = []
      expect { Genre.list_all_genres(genres) }.to output(/List of genre is empty/).to_stdout
    end
  end
end
