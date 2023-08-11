require_relative '../classes/book' # Adjust the path accordingly

RSpec.describe Book do
  let(:dummy_label) { double('label', title: 'Sample Title') }
  let(:dummy_author) { double('author', first_name: 'John', last_name: 'Doe') }
  let(:dummy_genre) { double('genre', name: 'Fiction') }

  describe '.list_books' do
    it 'outputs a message for empty book list' do
      books = []

      expect { Book.list_books(books) }.to output(/No books available/).to_stdout
    end
  end

  describe '.add_books' do
    let(:dummy_authors) { [dummy_author] }
    let(:dummy_labels) { [dummy_label] }
    let(:dummy_genres) { [dummy_genre] }

    before do
      allow_any_instance_of(Object).to receive(:gets).and_return('Sample Title', 'John', 'Doe', 'Publisher', 'Good',
                                                                 'Fiction', 'Red', '2023-08-11')
    end
  end
end
