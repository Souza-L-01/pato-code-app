puts "Cleaning database..."

Language.destroy_all
Track.destroy_all
Lesson.destroy_all
Prompt.destroy_all
Recording.destroy_all
User.destroy_all

puts "Creating languages..."
javascript = { name: "JavaScript", filepath: File.join(__dir__, "icons/js-folder.svg") }
ruby =  { name: "Ruby", filepath: File.join(__dir__, "icons/ruby-folder.svg") }
css = { name: "CSS", filepath: File.join(__dir__, "icons/CSS-folder.svg") }
html = { name: "HTML", filepath: File.join(__dir__, "icons/html-folder.svg") }

languages = [ruby, javascript, html, css]

languages.each do |attributes|
  language = Language.create!(name: attributes[:name])
  file = File.open(attributes[:filepath])
  language.image.attach(io: file, filename: "#{attributes[:name]}.svg", content_type: "image/svg+xml")
  puts "Created #{language.name}"
end

puts "Created languages"

puts "Creating users"

user1 = User.create!(email: "lunna@hotmail.com", username: "Lunna", password: "123456")
user2 = User.create!(email: "someone@hotmail.com", username: "Sjors", password: "123456")
user3 = User.create!(email: "joop@hotmail.com", username: "Joop", password: "123456")
user4 = User.create!(email: "hans@hotmail.com", username: "Hans", password: "123456")


users = [user1, user2, user3, user4]

users.each do |user|
  unless user.avatar.attached?
  default_avatar = "duck1ava.png"
  file = File.open(File.join(__dir__, "icons/", default_avatar))
  user1.avatar.attach(io: file, filename: default_avatar)
  end
end

puts "Created #{user1.email}"
puts "Created #{user2.email}"

# puts "Creating prompts"

# puts "Prompts created"

puts "Creating tracks"

track_ruby1 = Track.create!(
  title: "Ruby Basics",
  language: Language.find_by(name: "Ruby")
)

track_ruby2 = Track.create!(
  title: "Ruby Vocabulary",
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

puts "Created tracks"

puts "\nCreating lessons"

hard_lesson1 = Lesson.create!(
  title: "Iterators and generators",
  content: "def convert(minutes)\n return minutes * 60;\n end",
  columns_explanation: "Here we are defining a method to convert minutes into seconds. To do that we need to multiply the minutes into seconds. This method can be applied to any number of minutes.",
  difficulty: 4,
  track_id: track_ruby4.id
)

hard_lesson2 = Lesson.create!(
  title: "Enhanced Stupid Coach",
  content: "Stupid coaching is super nice",
  columns_explanation: "In this lesson we will go through the flow of our stupid coaching exercise",
  difficulty: 4,
  track_id: track_ruby4.id
)

Lesson.create!(
  title: "Convert Minutes into Seconds",
  content: "def convert(minutes)\n return minutes * 60;\n end",
  columns_explanation: "Here we are defining a method to convert minutes into seconds. To do that we need to multiply the minutes into seconds. This method can be applied to any number of minutes.",
  difficulty: 1,
  track_id: track_ruby1.id
)

Lesson.create!(
  title: "Convert Age to Days",
  content: "def calc_age(age)\n return age * 365;\n end",
  columns_explanation: "This code defines a Ruby method called calc_age that takes a parameter called age. The purpose of this method is to calculate the approximate number of days by multiplying the given age by 365.",
  difficulty: 2,
  track_id: track_ruby1.id
)

Lesson.create!(
  title: "String Reverse",
  content: "def reverse(txt)\n  txt.reverse\nend",
  columns_explanation: "In this lesson, we define a method called reverse that takes a string as input and returns the reversed version of the string. We use the `reverse` method provided by Ruby, which reverses the characters in the string. This method can be helpful when you need to reverse the order of characters in a string for various purposes.",
  difficulty: 1,
  track_id: track_ruby1.id
)

Lesson.create!(
  title: "Sum of All Digits",
  content: "def sum_digits(num)\n  num.digits.sum\nend",
  columns_explanation: "In this lesson, we define a method called sum_digits that takes a number as input and returns the sum of its digits. We use the `digits` method provided by Ruby, which returns an array of the digits of the number. We then use the `sum` method to calculate the sum of the digits. This method can be useful when you need to calculate the sum of individual digits in a number.",
  difficulty: 2,
  track_id: track_ruby1.id
)

Lesson.create!(
  title: "Check if Palindrome",
  content: "def palindrome?(txt)\n  txt == txt.reverse\nend",
  columns_explanation: "In this lesson, we define a method called palindrome? that takes a string as input and checks if it is a palindrome. We compare the input string with its reversed version using the `reverse` method provided by Ruby. If the two strings are equal, it means the input string is a palindrome. This method can be used to determine if a given string reads the same forwards and backwards.",
  difficulty: 3,
  track_id: track_ruby1.id
)

Lesson.create!(
  title: "Find the Largest Number",
  content: "def find_largest(nums)\n  nums.max\nend",
  columns_explanation: "In this lesson, we define a method called find_largest that takes an array of numbers as input and returns the largest number in the array. We use the `max` method provided by Ruby, which returns the maximum value in the array. This method can be helpful when you need to find the largest number in a collection of numbers.",
  difficulty: 1,
  track_id: track_ruby1.id
)

Lesson.create!(
  title: "Title Case",
  content: "def title_case(txt)\n  txt.split.map(&:capitalize).join(' ')\nend",
  columns_explanation: "In this lesson, we define a method called title_case that takes a sentence as input and converts it to title case. We use the `split` method to break the sentence into an array of words, `map` to capitalize the first letter of each word, and `join` to combine the words back into a sentence. This method can be used to convert a sentence to title case format.",
  difficulty: 2,
  track_id: track_ruby1.id
)

Lesson.create!(
  title: "Power Calculator",
  content: "function circuitPower(voltage, current) {\n return voltage * current; \n}",
  columns_explanation: "The code inside the function return voltage * current; performs the calculation. It multiplies the value of the voltage parameter by the value of the current parameter, and then returns the result. To use this function, you can call it and provide values for the voltage and current parameters. The function will return the calculated power value.",
  difficulty: 4,
  track_id: track_js1.id
)

Lesson.create!(
  title: "Find the Maximum Number",
  content: "function findMax(arr) {\n  return Math.max(...arr);\n}",
  columns_explanation: "In this lesson, we define a function called findMax that takes an array as input and returns the maximum number in the array. We use the `Math.max` function along with the spread syntax (`...`) to find the maximum value in the array. This method can be helpful when you need to find the largest number in a collection of numbers.",
  difficulty: 2,
  track_id: track_js1.id
)

Lesson.create!(
  title: "Calculate Factorial",
  content: "function factorial(num) {\n  if (num === 0) return 1;\n  return num * factorial(num - 1);\n}",
  columns_explanation: "In this lesson, we define a function called factorial that calculates the factorial of a number. It uses a recursive approach to multiply the number with the factorial of the number minus one until the base case (num === 0) is reached. This method can be used to calculate the factorial of a given number.",
  difficulty: 3,
  track_id: track_js1.id
)

Lesson.create!(
  title: "Reverse a String",
  content: "function reverseString(str) {\n  return str.split('').reverse().join('');\n}",
  columns_explanation: "In this lesson, we define a function called reverseString that takes a string as input and returns the reversed version of the string. We use the `split('')` method to convert the string into an array of characters, `reverse()` to reverse the order of the characters, and `join('')` to combine the characters back into a string. This method can be used to reverse the order of characters in a given string.",
  difficulty: 2,
  track_id: track_js1.id
)

Lesson.create!(
  title: "Check for Palindrome",
  content: "function isPalindrome(str) {\n  return str === str.split('').reverse().join('');\n}",
  columns_explanation: "In this lesson, we define a function called isPalindrome that checks if a given string is a palindrome. It compares the input string with its reversed version using the same approach as the reverseString function. If the two strings are equal, it means the input string is a palindrome. This method can be used to determine if a given string reads the same forwards and backwards.",
  difficulty: 2,
  track_id: track_js1.id
)

Lesson.create!(
  title: "Title Case",
  content: "function titleCase(str) {\n  return str.toLowerCase().split(' ').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' ');\n}",
  columns_explanation: "In this lesson, we define a function called titleCase that takes a sentence as input and converts it to title case. It uses a combination of methods to achieve the desired result. The `toLowerCase()` method converts the entire string to lowercase, `split(' ')` breaks the string into an array of words, `map()` applies a transformation to each word by capitalizing its first letter, and `join(' ')` combines the words back into a sentence. This method can be used to convert a sentence to title case format.",
  difficulty: 2,
  track_id: track_js1.id
)

Lesson.create!(
  title: "Centering Elements",
  content: ".center {\n  display: flex;\n  justify-content: center;\n  align-items: center;\n}",
  columns_explanation: "In this lesson, we define a CSS class called 'center' that can be used to center elements horizontally and vertically. By setting the 'display' property to 'flex' on the container element, and using 'justify-content: center' and 'align-items: center' properties, the elements inside the container will be centered both horizontally and vertically. This technique is commonly used for centering elements within a parent container.",
  difficulty: 1,
  track_id: track_css1.id
)

Lesson.create!(
  title: "Creating a Responsive Grid",
  content: ".grid-container {\n  display: grid;\n  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));\n  gap: 20px;\n}",
  columns_explanation: "In this lesson, we define a CSS class called 'grid-container' that creates a responsive grid layout. By using the 'display: grid' property on the container element, and setting 'grid-template-columns' to 'repeat(auto-fit, minmax(200px, 1fr))', the grid will automatically adjust the number of columns based on the available space while maintaining a minimum width of 200px for each column. The 'gap' property is used to add spacing between the grid items. This technique is useful for creating responsive and flexible grid layouts.",
  difficulty: 2,
  track_id: track_css1.id
)

Lesson.create!(
  title: "Styling Links",
  content: "a {\n  text-decoration: none;\n  color: #007bff;\n}\n\na:hover {\n  text-decoration: underline;\n}",
  columns_explanation: "In this lesson, we define CSS styles for links. By targeting the 'a' selector, we remove the default underline decoration using 'text-decoration: none' and set the link color to '#007bff'. Additionally, we add a hover effect by targeting 'a:hover' and applying 'text-decoration: underline' to create an underline effect when the user hovers over the link. These styles can be customized to fit the desired design and improve the user experience.",
  difficulty: 1,
  track_id: track_css1.id
)

Lesson.create!(
  title: "Creating a Responsive Navigation Bar",
  content: ".navbar {\n  display: flex;\n  justify-content: space-between;\n  align-items: center;\n  background-color: #f8f8f8;\n  padding: 10px;\n}\n\n.navbar ul {\n  list-style-type: none;\n  margin: 0;\n  padding: 0;\n  display: flex;\n}\n\n.navbar li {\n  margin-right: 10px;\n}\n\n.navbar a {\n  text-decoration: none;\n  color: #333;\n}",
  columns_explanation: "In this lesson, we define CSS styles for creating a responsive navigation bar. The 'navbar' class sets the container to a flex layout, with 'justify-content: space-between' and 'align-items: center' to distribute the content evenly and center it vertically. The 'background-color', 'padding', and other properties can be adjusted to fit the desired design. The 'navbar ul', 'navbar li', and 'navbar a' styles define the appearance of the navigation links and their list. This technique can be used to create a responsive and visually",
  difficulty: 1,
  track_id: track_css1.id
)

Lesson.create!(
  title: "Creating CSS Animations",
  content: "@keyframes spin {\n  from { transform: rotate(0deg); }\n  to { transform: rotate(360deg); }\n}\n\n.spin-animation {\n  animation: spin 2s linear infinite;\n}",
  columns_explanation: "In this lesson, we define a CSS animation called 'spin' using the '@keyframes' rule. It specifies the transformation from the starting point (0 degrees) to the ending point (360 degrees) over a duration of 2 seconds. The 'spin-animation' class is then used to apply the 'spin' animation to an element. The 'animation' property is set to 'spin' to reference the animation name, '2s' for the duration, 'linear' for the timing function, and 'infinite' to repeat the animation indefinitely. This technique can be used to create various types of animations by defining keyframes and applying them to different elements.",
  difficulty: 2,
  track_id: track_css1.id
)

Lesson.create!(
  title: "Creating a Basic HTML Structure",
  content: "<!DOCTYPE html>\n<html>\n<head>\n  <title>My Webpage</title>\n</head>\n<body>\n  <header>\n    <h1>Welcome to My Webpage</h1>\n  </header>\n  <nav>\n    <ul>\n      <li><a href=\"#\">Home</a></li>\n      <li><a href=\"#\">About</a></li>\n      <li><a href=\"#\">Contact</a></li>\n    </ul>\n  </nav>\n  <main>\n    <h2>About Me</h2>\n    <p>This is some content about me.</p>\n  </main>\n  <footer>\n    <p>&copy; 2023 My Webpage. All rights reserved.</p>\n  </footer>\n</body>\n</html>",
  columns_explanation: "In this lesson, we create a basic HTML structure for a webpage. The HTML structure consists of the `<!DOCTYPE html>` declaration, the opening and closing `<html>` tags, and the main sections of a webpage. The structure includes a `<head>` section for the webpage title, a `<body>` section for the content, a `<header>` for the page header, a `<nav>` for navigation links, a `<main>` for the main content, and a `<footer>` for the page footer. This structure provides a foundation for building webpages and can be expanded upon with additional HTML elements and content.",
  difficulty: 1,
  track_id: track_html1.id
)

Lesson.create!(
  title: "Working with Images",
  content: "<img src=\"path/to/image.jpg\" alt=\"Description of the image\">",
  columns_explanation: "In this lesson, we learn how to insert an image into an HTML page. The `<img>` tag is used to include an image on a webpage. The `src` attribute specifies the path to the image file, and the `alt` attribute provides alternative text that is displayed if the image cannot be loaded or for accessibility purposes. Make sure to replace 'path/to/image.jpg' with the actual path to your image file, and provide a descriptive 'alt' text for accessibility purposes.",
  difficulty: 2,
  track_id: track_html1.id
)

Lesson.create!(
  title: "Creating Links",
  content: "<a href=\"https://www.example.com\">Visit Example Website</a>",
  columns_explanation: "In this lesson, we learn how to create a link in HTML. The `<a>` tag is used to define a hyperlink. The `href` attribute specifies the URL that the link should navigate to. The link text is placed between the opening and closing `<a>` tags. Replace 'https://www.example.com' with the actual URL you want to link to, and provide descriptive link text that indicates the purpose of the link.",
  difficulty: 2,
  track_id: track_html1.id
)

Lesson.create!(
  title: "Creating an Ordered List",
  content: "<ol>\n  <li>First item</li>\n  <li>Second item</li>\n  <li>Third item</li>\n</ol>",
  columns_explanation: "In this lesson, we learn how to create an ordered list in HTML. The `<ol>` tag is used to define an ordered list. Each list item is represented by the `<li>` tag. The list items are automatically numbered by the browser. Replace the placeholder text with your own list items to create a custom ordered list.",
  difficulty: 2,
  track_id: track_html1.id
)

Lesson.create!(
  title: "Creating a Table",
  content: "<table>\n  <thead>\n    <tr>\n      <th>Header 1</th>\n      <th>Header 2</th>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <td>Row 1, Cell 1</td>\n      <td>Row 1, Cell 2</td>\n    </tr>\n    <tr>\n      <td>Row 2, Cell 1</td>\n      <td>Row 2, Cell 2</td>\n    </tr>\n  </tbody>\n</table>",
  columns_explanation: "In this lesson, we learn how to create a table in HTML. The `<table>` tag is used to define a table. The table structure consists of `<thead>` for the table header, `<tbody>` for the table body, and `<tr>` for each table row. Within each row, the data is represented by the `<td>` tags. The table header cells are represented by `<th>` tags. Customize the table headers and data cells with your own content to create a table that suits your needs.",
  difficulty: 3,
  track_id: track_html1.id
)

puts "Lessons created"

puts "\nCreating posts"

post1 = Post.create!(
  title: "I am crying right now :'(",
  content: "I need help! I really don't get this exercise.",
  user_id: user2.id,
  lesson_id: hard_lesson1.id,
  timestamp: Time.now.yesterday
)

post2 = Post.create!(
  title: "I am super stuck!",
  content: "Can someone help me?",
  user_id: user3.id,
  lesson_id: hard_lesson2.id,
  timestamp: Time.new(2023, 5, 17, 10, 30, 0)
)

puts "Posts created"

puts "Creating comments"

Comment.create!(
  content: "If you give me some context I will try to help you out, mate!",
  user_id: user4.id,
  post_id: post2.id,
  timestamp: Time.now
)

Comment.create!(
  content: "Can you explain? I want to help you out!",
  user_id: user4.id,
  post_id: post1.id,
  timestamp: Time.now
)

puts "Comments created"

puts "\nFinished"
