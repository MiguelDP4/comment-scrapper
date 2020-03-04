require 'nokogiri'
require 'watir'
require 'open-uri'
load 'lib/course_class.rb'

class PageReader
  @courses = []
  def initialize(page, keyword = '', min_price = nil, max_price = nil)
    @page = page
    @keyword = keyword
    @min_price = min_price
    @max_price = max_price
  end

  def search_all_courses
    Watir.default_timeout = 120
    browser = Watir::Browser.new
    browser.goto(@page)
    browser.element(css: '.ud-component--logged-out-home--onboarding').wait_until(&:present?)
    sleep 2
    2.times { browser.send_keys :space }
    sleep 0.75
    browser.buttons(css: '.carousel-arrow')[1].click
    12.times do
      browser.buttons(css: '.carousel-arrow')[2].click
      sleep 0.75
    end
    loaded_html = Nokogiri::HTML(browser.html)
    filtered_html = loaded_html.css('.course-discovery-unit--course-discovery-unit-container--3MFr9')[1]
    slides_html = filtered_html.css('.slick-slide')
    create_courses_array(slides_html)
  end

  def create_courses_array(slides_html)
    course_array = []
    slides_html.each do |slide|
      name = slide.css('.merchandising-course-card--course-title--2Ob4m').text
      author = slide.css('.merchandising-course-card--instructor-titles--vXVfV').text
      price = slide.css('.course-price-text').css('span span').text
      previous_price = slide.css('.original-price-container').css('div span s span').text
      tmp_course = Course.new(name, author, price, previous_price)
      course_array.push(tmp_course) unless price == "" || previous_price == ""
    end
    course_array
  end

  def search_by_name(key)
    course_array = search_all_courses
    course_array.select { |course| course.name.downcase.include? key.downcase }
  end

  def search_by_price(min, max)
    course_array = search_all_courses
    course_array.select do |course|
      course_price = course.price[1..course.price.length - 1].to_f
      course_price >= min && course_price <= max
    end
  end

  def search_by_all_parameters(name, min, max)
    course_array = search_all_courses
    course_array.select do |course|
      course_name = course.name.downcase
      course_price = course.price[1..course.price.length - 1].to_f
      course_name.include?(name.downcase) && course_price <= max && course_price >= min
    end
  end
end
