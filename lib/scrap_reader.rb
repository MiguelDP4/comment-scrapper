require 'nokogiri'
require 'watir'
require 'open-uri'
require_relative 'course_class.rb'

class PageReader
  @courses = []
  def initialize(page)
    @page = page
    @courses = search_all_courses
  end

  def search_by_name(key)
    if key == ''
      @courses
    else
      @courses.select { |course| course.name.downcase.include? key.downcase }
    end
  end

  def search_by_price(min, max)
    @courses.select do |course|
      course_price = course.price[1..course.price.length - 1].to_f
      course_price >= min && course_price <= max
    end
  end

  def search_by_all_parameters(name, min, max)
    @courses.select do |course|
      course_name = course.name.downcase
      course_price = course.price[1..course.price.length - 1].to_f
      course_name.include?(name.downcase) && course_price <= max && course_price >= min
    end
  end

  private

  def search_all_courses
    Watir.default_timeout = 120
    browser = Watir::Browser.new
    browser.goto(@page)
    sleep 5
    if browser.buttons(css: '.carousel--next-button--3LJyN')[7].exist?
      type_one_page_procedure(browser)
    else
      type_two_page_procedure(browser)
    end
  end

  def type_one_page_procedure(browser)
    13.times do
      browser.buttons(css: '.carousel--next-button--3LJyN')[7].click
      sleep 1
    end
    loaded_html = Nokogiri::HTML(browser.html)
    filtered_html = loaded_html.css('.carousel--scroll-lock--3AYO9')[8]
    slides_html = filtered_html.css('.carousel--scroll-item--3Wciz')
    browser.close
    create_courses_array(slides_html)
  end

  def type_two_page_procedure(browser)
    browser.buttons(css: '.carousel-arrow')[1].click
    12.times do
      browser.buttons(css: '.carousel-arrow')[2].click
      sleep 0.75
    end
    loaded_html = Nokogiri::HTML(browser.html)
    filtered_html = loaded_html.css('.course-discovery-unit--course-discovery-unit-container--3MFr9')[1]
    slides_html = filtered_html.css('.slick-slide')
    browser.close
    create_courses_array(slides_html)
  end

  def create_courses_array(slides_html)
    course_array = []
    if slides_html[0].at_css('.course-card--course-title--2f7tE')
      slides_html.each do |slide|
        tmp_course = save_course_instance_type_one(slide)
        course_array.push(tmp_course) unless tmp_course.price == '' || tmp_course.previous_price == ''
      end
    else
      slides_html.each do |slide|
        tmp_course = save_course_instance_type_two(slide)
        course_array.push(tmp_course) unless tmp_course.price == '' || tmp_course.previous_price == ''
      end
    end
    course_array
  end

  def save_course_instance_type_one(slide)
    name = slide.css('.course-card--course-title--2f7tE').text
    author = slide.css('.course-card--instructor-list--lIA4f').text
    price = slide.css('.course-card--discount-price--3TaBk').css('span span').text
    previous_price = slide.css('.price-text--original-price--2e-F5').css('div span s span').text
    tmp_course = Course.new(name, author, price, previous_price)
  end

  def save_course_instance_type_two(slide)
    name = slide.css('.merchandising-course-card--course-title--2Ob4m').text
    author = slide.css('.merchandising-course-card--instructor-titles--vXVfV').text
    price = slide.css('.course-price-text').css('span span').text
    previous_price = slide.css('.original-price-container').css('div span s span').text
    tmp_course = Course.new(name, author, price, previous_price)
  end
end
