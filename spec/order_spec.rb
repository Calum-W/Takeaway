require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:filled_basket) { [["Beefburger", 5], ["Crisps", 1]] }



  describe "#calculate_price" do
    it "adds the cost of all items in the current order" do
      expect(order.calculate_price(filled_basket)).to eq 6
    end
  end
  describe "#receipt" do
    it "prints all ordered items and the total cost" do
      expect{ order.receipt(filled_basket) }.to output("Beefburger  £5\nCrisps  £1\nTOTAL: £6\n").to_stdout
    end
  end
end
