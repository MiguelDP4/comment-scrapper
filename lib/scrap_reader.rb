require 'open-uri'
load 'course_class.rb'

class PageReader
  def initialize(page, keyword = '', min_price = nil, max_price = nil)
    @page = Nokogiri::HTML(open(page))
    @keyword = keyword
    @min_price = min_price
    @max_price = max_price
  end
end
