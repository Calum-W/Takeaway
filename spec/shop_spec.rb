require 'shop'
require 'menu'

describe Shop do

  subject(:shop) { described_class.new }
  let(:menu) { double(:menu, dishes: "this is the menu") }
  let(:set_time) { Time.new(2017, 12, 4, 2, 2, 2) }

  describe "#add_to_order" do
    it "adds a single item to the basket" do
      basket = []
      shop.add_to_order(1, 1, basket)
      expect(basket).to include ["Beefburger", 5]
    end
    it "adds multiples of an item to the basket" do
      basket = []
      shop.add_to_order(1, 2, basket)
      expect(basket).to eq [["Beefburger", 5], ["Beefburger", 5]]
    end
  end
  describe "#place_order" do
    it "returns a confirmation message with a delivery time one hour from now" do
      expect{ shop.place_order(set_time) }.to output("Thank you! Your order was placed and will be delivered before 03:02\n").to_stdout
    end
  end
end
