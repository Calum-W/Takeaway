require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dishes) { double(:dishes) }

  describe "#beautiful_printer" do
    it "prints the menu in a beautiful way" do
      dish = { 1 => ["food", "price"] }
      expect{ menu.beautiful_printer(dish) }.to output("1. food  £price\n").to_stdout
    end
  end
end
