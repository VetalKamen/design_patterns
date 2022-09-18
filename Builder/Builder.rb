
class HttpRequestBuilder

  def initialize(http_request)
    @http_request = http_request
  end

  def set_endpoint
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def set_limit
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def get_custom_request
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ConcreteApiRequest < HttpRequestBuilder

  def set_endpoint
    #set new enpoint for concrete API
  end

  def set_limit
    # set limit to request
  end

  def get_custom_request
    # get newely build request
  end
end

class HttpRequest
  def initialize(endpoint, limit)
    @endpoint = endpoint
    @limit = limit
  end

  def set_params_to_query(param, value)
    @endpoint += "&#{param}=#{value}"
  end
end

class HttpRequestDirector
  attr_accessor :builder

  def initialize
    @builder = nil
  end

  def builder=(builder)
    @builder = builder
  end

  def build(limit = 5)
    @builder.set_endpoint
    @builder.set_limit(limit)
    @builder.get_custom_request
  end
end


director = HttpRequestDirector.new
request = HttpRequest.new('some.endpoint', 10)
builder = ConcreteApiRequest.new(request)
director.builder = builder

director.build(builder)

# Without director
builder.set_endpoint
builder.set_limit
builder.get_custom_request
