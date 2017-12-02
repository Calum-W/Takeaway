require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dishes) { double(:dishes) }

  describe "#beautiful_printer" do
    it "prints the menu in a beautiful way" do
      dish = { 1 => ["food", "price"] }
      expect(menu.beautiful_printer(dish)).to eq "1. food  £price"
      dish.each do |key, value|
        puts "#{key}. #{value[0]}  £#{value[1]}"
      end
    end
  end
end
