require_relative '../classes/label'  # Adjust the path accordingly

RSpec.describe Label do
  let(:dummy_item) { double('item') }

  describe '#initialize' do
    it 'initializes a label object with title, color, and optional id' do
      label = Label.new('Sample Title', 'Red', 123)
      expect(label.title).to eq('Sample Title')
      expect(label.color).to eq('Red')
      expect(label.id).to eq(123)
    end
  end

  describe '.list_all_labels' do
    it 'lists all labels' do
      labels = [
        Label.new('Label 1', 'Red', 123),
        Label.new('Label 2', 'Blue', 456)
      ]

      expect { Label.list_all_labels(labels) }.to output(/Label 1.*Label 2/m).to_stdout
    end

    it 'outputs a message for empty label list' do
      labels = []

      expect { Label.list_all_labels(labels) }.to output(/No labels available/).to_stdout
    end
  end
end
