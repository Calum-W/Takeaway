require 'shop'
require 'menu'

describe Shop do

  subject(:shop) { described_class.new }
  let(:menu) { double(:menu, dishes: "this is the menu") }

  # describe "#show_menu" do
  #   it "prints all dishes" do
  #     expect(shop.show_menu(menu)).to eq "this is the menu"
  #   end
  # end
  describe "#add_to_order" do
    it "adds an item to the basket" do
      basket = []
      shop.add_to_order(1, 1, basket)
      expect(basket).to include ["Beefburger", 5]
    end
  end
end
