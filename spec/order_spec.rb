require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:filled_basket) { [["Beefburger", 5], ["Crisps", 1]] }



  describe "#calculate_price" do
    it "adds the cost of all items in the current order" do
      expect(order.calculate_price(filled_basket)).to eq 6
    end
  end
end
