class Course
  attr_reader :name, :author, :price, :previous_price
  def initialize(name, author, price, previous_price)
    @name = name
    @author = author
    @price = price
    @previous_price = previous_price
  end
end
