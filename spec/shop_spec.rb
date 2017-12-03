require 'shop'
require 'menu'

describe Shop do
  subject(:shop) { described_class.new }
  let(:menu) { double(:menu, dishes: 'this is the menu') }
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
    it "clears the current order" do
      shop.place_order(set_time, false)
      expect(shop.current_order).to eq nil
    end
  end
end
