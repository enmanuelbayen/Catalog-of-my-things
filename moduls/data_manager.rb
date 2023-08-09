require 'json'

module DataManager
  DATA_FOLDER = 'json_files'.freeze

  def save_data_to_json(filename, data)
    serialized_data = data.map(&:to_h)
    File.write(File.join(DATA_FOLDER, "#{filename}.json"), JSON.pretty_generate(serialized_data))
  end

  def load_data_from_json(filename, klass)
    data_file_path = File.join(DATA_FOLDER, "#{filename}.json")
    serialized_data = JSON.parse(File.read(data_file_path), symbolize_names: true)

    serialized_data.map do |item_data|
      item_data[:publish_date] = Date.parse(item_data[:publish_date]) if item_data[:publish_date]
      klass.new(**item_data)
    end
  rescue Errno::ENOENT
    []
  end
end
