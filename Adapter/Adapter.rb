# Target
class HttpClient

  def request
    #code
  end
end

# Adaptee
class CustomHttpClient

  def specific_request
    #code
  end
end
# Adapter
class HttpClientAdapter < HttpClient

  def initialize(custom_http_client)
    @custom_http_client = custom_http_client
  end

  def request
    @custom_http_client.specific_request
  end
end

# The client code supports all classes that follow the Target interface.
def client_code(target)
  print target.request
end

puts 'Client: I can work just fine with the Target objects:'
target = HttpClient.new
client_code(target)
puts "\n\n"

adaptee = CustomHttpClient.new
puts 'Client: The Adaptee class has a weird interface. See, I don\'t understand it:'
puts "Adaptee: #{adaptee.specific_request}"
puts "\n"

puts 'Client: But I can work with it via the Adapter:'
adapter = HttpClientAdapter.new(adaptee)
client_code(adapter)