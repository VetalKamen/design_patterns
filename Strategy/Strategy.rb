class CarFactory
  attr_writer :strategy

  def initialize(strategy)
    @strategy = strategy
  end

  def strategy=(strategy)
    @strategy = strategy
  end

  def do_some_business_logic
    # ...
    puts 'Creating Car with chosen'
    result = @strategy.do_algorithm('data')
    # ...
  end
end

class Strategy
  def do_algorithm(_data)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class EconomicStrategy < Strategy

  def do_algorithm(data)
    # do as cheapest as possible
  end
end

class BusinessStrategy < Strategy

  def do_algorithm(data)
    # do as expensive as possible
  end
end

context = CarFactory.new(EconomicStrategy.new)
puts 'Client: Strategy is set to economic.'
context.do_some_business_logic
puts "\n\n"

puts 'Client: Strategy is set to business.'
context.strategy = BusinessStrategy.new
context.do_some_business_logic
