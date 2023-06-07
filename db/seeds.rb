puts "Cleaning database..."
Language.destroy_all

puts "Creating languages..."
javascript = { name: "JavaScript", filepath: File.join(__dir__, "icons/js-folder.svg") }
ruby =  { name: "Ruby", filepath: File.join(__dir__, "icons/ruby-folder.svg") }
css = { name: "CSS", filepath: File.join(__dir__, "icons/CSS-folder.svg") }
html = { name: "HTML", filepath: File.join(__dir__, "icons/CSS-folder.svg") }

languages = [javascript, ruby, css, html]

languages.each do |attributes|
  language = Language.create!(name: attributes[:name])
  file = File.read(attributes[:filepath])
  language.image.attach(io: file, filename: "#{attributes[:name]}.svg", content_type: "image/svg+xml")
  language.save
  puts "Created #{language.name}"
end
puts "Finished!"
