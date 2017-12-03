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

  def receipt(basket = @basket)
    calculate_price(basket)
    basket.each { |x| puts "#{x[0]}  £#{x[1]}" }
    puts "TOTAL: £#{@total}"
  end

end
