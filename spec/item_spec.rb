require_relative '../classes/item'

RSpec.describe Item do
  let(:dummy_genre) { double('genre', items: []) }
  let(:dummy_author) { double('author', items: []) }
  let(:dummy_label) { double('label', items: []) }

  describe '#initialize' do
    it 'initializes an item object with publish_date and optional id' do
      item = Item.new('2023-08-11', 123)
      expect(item.publish_date).to eq('2023-08-11')
      expect(item.id).to eq(123)
      expect(item.archived).to be_falsey
    end

    it 'generates a random id if not provided' do
      allow(SecureRandom).to receive(:random_number).with(1..1000).and_return(456)
      item = Item.new('2023-08-11')
      expect(item.id).to eq(456)
    end
  end

  describe '#add_genre' do
    it 'adds a genre to the item' do
      item = Item.new('2023-08-11')
      expect(dummy_genre).to receive(:add_item).with(item)
      item.add_genre(dummy_genre)
      expect(item.genre).to eq(dummy_genre)
    end
  end

  describe '#add_author' do
    it 'adds an author to the item' do
      item = Item.new('2023-08-11')
      expect(dummy_author).to receive(:add_item).with(item)
      item.add_author(dummy_author)
      expect(item.author).to eq(dummy_author)
    end
  end

  describe '#add_label' do
    it 'adds a label to the item' do
      item = Item.new('2023-08-11')
      expect(dummy_label).to receive(:add_item).with(item)
      item.add_label(dummy_label)
      expect(item.label).to eq(dummy_label)
    end
  end
end
