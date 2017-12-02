require_relative 'menu.rb'
require_relative 'order.rb'

class Shop

  attr_reader :menu

  def initialize
    @menu = Menu.new
  end

  def show_menu(menu = @menu)
    menu.dishes
  end


end
