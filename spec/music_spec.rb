require_relative '../classes/music'
RSpec.describe MusicAlbum do
  let(:dummy_label) { double('label', title: 'Sample Title') }
  let(:dummy_author) { double('author', first_name: 'John', last_name: 'Doe') }
  let(:dummy_genre) { double('genre', name: 'Rock') }
  describe '.list_all_music_albums' do
    it 'outputs a message for empty music album list' do
      music_albums = []
      expect { MusicAlbum.list_all_music_albums(music_albums) }.to output(/Add a new music album first/).to_stdout
    end
  end
  describe '.add_music_album' do
    let(:dummy_authors) { [dummy_author] }
    let(:dummy_labels) { [dummy_label] }
    let(:dummy_genres) { [dummy_genre] }
    before do
      allow_any_instance_of(Object).to receive(:gets).and_return('Sample Title', 'John', 'Doe', 'Rock', 'Red',
                                                                 '2023-08-11')
    end
  end
end
