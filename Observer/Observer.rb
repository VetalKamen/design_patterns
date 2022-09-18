# abstract
class BouquetManager
  def attach(observer)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def detach(observer)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def notify
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class SeasonalBouquetManager < BouquetManager
  # default state
  attr_accessor :sale

  def initialize
    @observers = []
  end

  def attach(observer)
    puts 'SeasonalBouquetManager: Attached an observer.'
    @observers << observer
  end

  def detach(observer)
    @observers.delete(observer)
  end

  def notify
    puts 'SeasonalBouquetManager: Notifying observers...'
    @observers.each { |observer| observer.update(self) }
  end

  def some_business_logic
    puts "\nSeasonalBouquetManager: I'm doing research for sales."
    @sale = rand(0..10)

    puts "SeasonalBouquetManager: Seasonal bouquets price now is lower by: #{@sale}%"
    notify
  end
end

# abstract
class Customer
  def update(_subject)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ZakarpattiaCustomer < Customer
  def update(subject)
    puts 'ZakarpattiaCustomer: Reacted to the event' if subject.state < 3
  end
end

class LvivCustomer < Customer
  def update(subject)
    return unless subject.state.zero? || subject.state >= 2

    puts 'LvivCustomer: Reacted to the event'
  end
end

# The client code.

subject = SeasonalBouquetManager.new

observer_a = ZakarpattiaCustomer.new
subject.attach(observer_a)

observer_b = LvivCustomer.new
subject.attach(observer_b)

subject.some_business_logic
subject.some_business_logic

subject.detach(observer_a)

subject.some_business_logic
