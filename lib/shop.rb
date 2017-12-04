require_relative 'menu.rb'
require_relative 'order.rb'
require File.dirname(__FILE__) + '/twilio_integration'

class Shop

  DELIVERY_TIME = 60 * 60

  attr_reader :menu, :current_order, :sms_interface

  def initialize(sms_interface = TwilioIntegration)
    @menu = Menu.new
    @current_order = Order.new
    @sms_interface = sms_interface
  end

  def show_menu(menu = @menu)
    menu.beautiful_printer
  end

  def add_to_order(item_number, quantity, basket = @current_order.basket)
    raise "Please select an item 1-5" if item_number < 1 || item_number > 5
    quantity.times { basket.push(@menu.dishes[item_number]) }
  end

  def place_order(time = Time.now, sms = true, phone_number = ENV["TWILIO_RECEIVERS_PHONE"])
    send_sms(phone_number) if sms == true
    clear_order
  end

  private

  def delivery_estimate(time = Time.now)
    time += DELIVERY_TIME
    time.strftime('%H:%M')
  end

  def default_message
    "Thank you! Your order was placed and will be delivered before #{delivery_estimate}"
  end

  def send_sms(phone_number)
    sms_interface.send_sms(default_message, phone_number)
  end

  def clear_order
    @current_order = nil
  end
end
