load 'lib/scrap_reader.rb'
require 'colorize'

reader = PageReader.new('https://www.udemy.com/')
courses = reader.search_all_courses
i = 1
courses.each do |course|
  puts '==========================='.magenta
  puts 'Course number: '.green + i.to_s
  puts 'Course name: '.green + course.name.to_s
  puts 'Course author: '.green + course.author.to_s
  puts 'Course price: '.green + course.price.to_s
  puts 'Course original price: '.green + course.previous_price.to_s
  i += 1
end
