class Instrument
  
  attr_accessor :brand, :model, :price, :sku

end

class Guitar < Instrument

  attr_accessor :wood_type

  def initialize(brand, model, price, sku)
  	@brand = brand
  	@model = model
  	puts "I'm in Guitar"
  end

end

class DrumSet < Instrument

  attr_accessor :pieces

end

#instrument = Instrument.new
guitar = Guitar.new
