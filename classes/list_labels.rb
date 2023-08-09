def list_all_labels(labels)
  if labels.empty?
    puts 'No labels available.'
  else
    puts 'List of labels:'
    labels.each do |label|
      puts "Title: #{label.title}"
      puts "Color: #{label.color}"
      puts '---'
    end
  end
end
