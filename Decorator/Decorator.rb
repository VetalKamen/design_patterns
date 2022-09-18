class Bouquet
  def compose
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ConcreteBouquet < Bouquet
  def compose
    'ConcreteBouquet'
  end
end

class BouquetDecorator < Bouquet
  attr_accessor :bouquet

  def initialize(bouquet)
    @bouquet = bouquet
  end

  def compose
    @bouquet.compose
  end
end

class ValentineBouquetDecorator < BouquetDecorator

  def compose
    "ValentineBouquetDecorator(#{@bouquet.compose})"
  end
end

class AnniversaryConcreteDecorator < BouquetDecorator

  def compose
    "AnniversaryConcreteDecorator(#{@bouquet.compose})"
  end
end

def client_code(bouquet)
  print "RESULT: #{bouquet.compose}"
end

simple = ConcreteBouquet.new
puts 'Client: I\'ve got a simple bouquet:'
client_code(simple)

decorator1 = ValentineBouquetDecorator.new(simple)
decorator2 = AnniversaryConcreteDecorator.new(decorator1)
puts 'Client: Now I\'ve got a decorated bouquet:'
client_code(decorator2)
