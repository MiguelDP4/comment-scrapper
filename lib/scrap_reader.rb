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

  def get_all_courses
    Watir.default_timeout = 120
    browser = Watir::Browser.new
    browser.goto(@page)
    loaded_site = browser.element(css: ".ud-component--logged-out-home--onboarding").wait_until(&:present?)
    loaded_html = Nokogiri::HTML(browser.html)
    filtered_html = loaded_html.css('.course-discovery-unit--course-discovery-unit-container--3MFr9')[1]
    slides_html = filtered_html.css('.slick-slide')
    course_array = []
    for slide in slides_html
      name = slide.css('.merchandising-course-card--course-title--2Ob4m').text
      author = slide.css('.merchandising-course-card--instructor-titles--vXVfV').text
      price = slide.css('.course-price-text').css('span span').text
      previous_price = slide.css('.original-price-container').css('div span s span').text
      tmp_course = Course.new(name, author, price, previous_price)
      course_array.push(tmp_course)
    end
    course_array
  end

  def search_all

  end

  def search_by_name
  
  end

  def search_by_price

  end

  def search_by_all_parameters

  end
end
