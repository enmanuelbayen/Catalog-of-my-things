require_relative '../classes/game'
RSpec.describe Game do
  let(:dummy_label) { double('label', title: 'Sample Game Title') }
  let(:dummy_author) { double('author', first_name: 'John', last_name: 'Doe') }
  let(:dummy_genre) { double('genre', name: 'Adventure') }
  describe '.list_all_games' do
    it 'outputs a message for empty game list' do
      games = []
      expect { Game.list_all_games(games) }.to output(/No Games found/).to_stdout
    end
  end
  describe '.add_games' do
    let(:dummy_authors) { [dummy_author] }
    let(:dummy_labels) { [dummy_label] }
    let(:dummy_genres) { [dummy_genre] }
    before do
      allow_any_instance_of(Object).to receive(:gets).and_return('Sample Game Title', 'John', 'Doe', 'Adventure', '2023-08-11', 'y', '2021', 'Red')
    end
  end
end