class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      1 => ["Beefburger", 5],
      2 => ["Curry chips", 5],
      3 => ["Donner kebab", 5],
      4 => ["Pizza", 6],
      5 => ["Crisps", 1]
    }
  end

  def beautiful_printer(dishes = @dishes)
    dishes.each do |key, value|
      puts "#{key}. #{value[0]}  £#{value[1]}"
    end
  end
end
