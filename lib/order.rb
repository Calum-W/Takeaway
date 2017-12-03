class Order

  attr_accessor :basket
  attr_reader :total

  def initialize
    @basket = []
  end

  def calculate_price(basket = @basket)
    @total = 0
    basket.each do |x|
      @total += x[1]
    end
    @total
  end

  def basket
    @basket
  end

end
