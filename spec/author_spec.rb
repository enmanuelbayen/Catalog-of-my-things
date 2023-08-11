require_relative '../classes/author'
RSpec.describe Author do
  describe '#initialize' do
    it 'initializes an author object with first name, last name, and optional id' do
      author = Author.new('John', 'Doe', 123)
      expect(author.first_name).to eq('John')
      expect(author.last_name).to eq('Doe')
      expect(author.id).to eq(123)
    end
    it 'generates a random id if not provided' do
      allow(SecureRandom).to receive(:random_number).with(1..1000).and_return(456)
      author = Author.new('Jane', 'Smith')
      expect(author.id).to eq(456)
    end
  end
  describe '.list_all_authors' do
    it 'lists all authors' do
      authors = [
        Author.new('John', 'Doe', 123),
        Author.new('Jane', 'Smith', 456)
      ]
      expect { Author.list_all_authors(authors) }.to output(/John Doe.*Jane Smith/m).to_stdout
    end
    it 'outputs a message for empty author list' do
      authors = []
      expect { Author.list_all_authors(authors) }.to output(/Authors is empty/).to_stdout
    end
  end
  describe '#add_item' do
    it 'adds an item to the author' do
      author = Author.new('John', 'Doe')
      dummy_item = double('item')
      expect(dummy_item).to receive(:add_author).with(author)
      author.add_item(dummy_item)
      expect(author.items).to include(dummy_item)
    end
  end
end