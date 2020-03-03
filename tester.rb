load 'lib/scrap_reader.rb'

reader = PageReader.new("https://www.udemy.com/")
courses = reader.get_all_courses
i = 1
for course in courses
  puts "==========================="
  puts "Course number: #{i}"
  puts "Course name: #{course.name}"
  puts "Course author: #{course.author}"
  puts "Course price: #{course.price}"
  puts "Course original price: #{course.previous_price}"
  i += 1
end