User.destroy_all
Lesson.destroy_all

lunna = User.create!(email: "lunna@hotmail.com", password: "123456")

track_ruby1 = Track.create!(
  title: "Ruby Basic",
  language: "Ruby"
)

track_js1 = Track.create!(
  title: "JavaScript Basic",
  language: "JavaScript"
)

track_css1 = Track.create!(
  title: "CSS Basic",
  language: "CSS"
)

track_html1 = Track.create!(
  title: "HTML Basic",
  language: "HTML"
)


rubylesson1 = Lesson.create!(
  title: "Convert Minutes into Seconds",
  content: "def convert(minutes) return minutes * 60; end",
  columns_explanation: "Here we are defining a method to convert minutes into seconds. To do that we need to multiply the minutes into seconds. This method can be applied to any number of minutes.",
  difficulty: 1,
  track_id: track_ruby1.id
)

rubylesson2 = Lesson.create!(
  title: "Convert Age to Days",
  content: "def calc_age(age) return age * 365; end",
  columns_explanation: "This code defines a Ruby method called calc_age that takes a parameter called age. The purpose of this method is to calculate the approximate number of days by multiplying the given age by 365.",
  difficulty: 1,
  track_id: track_ruby1.id
)

javaScriptlesson1 = Lesson.create!(
  title: "Power Calculator",
  content: "function circuitPower(voltage, current) {return voltage * current;}",
  columns_explanation: "The code inside the function return voltage * current; performs the calculation. It multiplies the value of the voltage parameter by the value of the current parameter, and then returns the result. To use this function, you can call it and provide values for the voltage and current parameters. The function will return the calculated power value.",
  difficulty: 1,
  track_id: track_js1.id
)

javaScriptlesson2 = Lesson.create!(
  title: "Power Calculator",
  content: "function circuitPower(voltage, current) {return voltage * current;}",
  columns_explanation: "The code inside the function return voltage * current; performs the calculation. It multiplies the value of the voltage parameter by the value of the current parameter, and then returns the result. To use this function, you can call it and provide values for the voltage and current parameters. The function will return the calculated power value.",
  difficulty: 1,
  track_id: track_js1.id
)
