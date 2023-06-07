puts "Cleaning database..."
Language.destroy_all

puts "Creating languages..."
javascript = { name: "JavaScript" }
ruby =  { name: "Ruby" }
css = { name: "CSS" }
html = { name: "HTML" }

languages = [javascript, ruby, css, html]

languages.each do |attributes|
  language = Language.create!(attributes)
  puts "Created #{language.name}"
end
puts "Finished!"
