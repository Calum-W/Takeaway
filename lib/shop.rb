require_relative 'menu.rb'
require_relative 'order.rb'

class Shop

  DELIVERY_TIME = 60 * 60

  attr_reader :menu, :current_order

  def initialize
    @menu = Menu.new
    @current_order = Order.new
  end

  def show_menu(menu = @menu)
    menu.beautiful_printer
  end

  def add_to_order(item_number, quantity, basket = @current_order.basket)
    quantity.times { basket.push(@menu.dishes[item_number]) }
  end

  def place_order(time = Time.now)
    puts "Thank you! Your order was placed and will be delivered before #{delivery_estimate(time)}"
    clear_order
  end

  private

  def delivery_estimate(time)
    time += DELIVERY_TIME
    time.strftime("%H:%M")
  end

  def clear_order
    @current_order = nil
  end
end
