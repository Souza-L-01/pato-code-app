puts "Cleaning database..."

User.destroy_all
Lesson.destroy_all
Track.destroy_all
Language.destroy_all

puts "Creating languages..."
javascript = { name: "JavaScript", filepath: File.join(__dir__, "icons/js-folder.svg") }
ruby =  { name: "Ruby", filepath: File.join(__dir__, "icons/ruby-folder.svg") }
css = { name: "CSS", filepath: File.join(__dir__, "icons/css-folder.svg") }
html = { name: "HTML", filepath: File.join(__dir__, "icons/html-folder.svg") }

languages = [javascript, ruby, css, html]

languages.each do |attributes|
  language = Language.create!(name: attributes[:name])
  file = File.open(attributes[:filepath])
  language.image.attach(io: file, filename: "#{attributes[:name]}.svg", content_type: "image/svg+xml")
  puts "Created #{language.name}"
end
puts "Finished!"

User.create!(email: "lunna@hotmail.com", password: "123456")

track_ruby1 = Track.create!(
  title: "Ruby Basics",
  language: Language.find_by(name: "Ruby")
)

track_js1 = Track.create!(
  title: "JavaScript Basic",
  language: Language.find_by(name: "JavaScript")
)

track_css1 = Track.create!(
  title: "CSS Basic",
  language: Language.find_by(name: "CSS")
)

track_html1 = Track.create!(
  title: "HTML Basic",
  language: Language.find_by(name: "HTML")
)

track_ruby2 = Track.create!(
  title: "Ruby Methods",
  language: Language.find_by(name: "Ruby")
)

track_ruby3 = Track.create!(
  title: "Ruby Functions",
  language: Language.find_by(name: "Ruby")
)

track_ruby4 = Track.create!(
  title: "Ruby Advanced",
  language: Language.find_by(name: "Ruby")
)

Lesson.create!(
  title: "Convert Minutes into Seconds",
  content: "def convert(minutes) return minutes * 60; end",
  columns_explanation: "Here we are defining a method to convert minutes into seconds. To do that we need to multiply the minutes into seconds. This method can be applied to any number of minutes.",
  difficulty: 1,
  track_id: track_ruby1.id
)

Lesson.create!(
  title: "Convert Age to Days",
  content: "def calc_age(age) return age * 365; end",
  columns_explanation: "This code defines a Ruby method called calc_age that takes a parameter called age. The purpose of this method is to calculate the approximate number of days by multiplying the given age by 365.",
  difficulty: 1,
  track_id: track_ruby1.id
)

Lesson.create!(
  title: "Power Calculator",
  content: "function circuitPower(voltage, current) {return voltage * current;}",
  columns_explanation: "The code inside the function return voltage * current; performs the calculation. It multiplies the value of the voltage parameter by the value of the current parameter, and then returns the result. To use this function, you can call it and provide values for the voltage and current parameters. The function will return the calculated power value.",
  difficulty: 1,
  track_id: track_js1.id
)

Lesson.create!(
  title: "Power Calculator",
  content: "function circuitPower(voltage, current) {return voltage * current;}",
  columns_explanation: "The code inside the function return voltage * current; performs the calculation. It multiplies the value of the voltage parameter by the value of the current parameter, and then returns the result. To use this function, you can call it and provide values for the voltage and current parameters. The function will return the calculated power value.",
  difficulty: 1,
  track_id: track_js1.id
)
