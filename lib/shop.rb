require_relative 'menu.rb'
require_relative 'order.rb'

class Shop

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
end
