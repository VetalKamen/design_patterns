class CustomHttpClient
  def get(url, options) end

  def post(url, options) end
end

class HttpParty < CustomHttpClient
  def get(url, options)
    #code
  end

  def post(url, options)
    # code
  end
end

# Factory -> Logger
class ProxyCustomHttpClientHandler < CustomHttpClient
  def initialize(custom_client, custom_logger)
    @real_client = custom_client
    @file_logger = custom_logger
  end

  def get(url, options)
    @real_client.get(url, options)
  rescue Error => e
    @file_logger.write_logs("CustomHttpClient exception in the #{@real_client.class} GET| Message:#{e.message}")
  end

  def post(url, options)
    @real_client.get(url, options)
  rescue Error => e
    @file_logger.write_logs("CustomHttpClient exception in the #{@real_client.class} POST| Message:#{e.message}")
  end
end

proxy = ProxyCustomHttpClientHandler.new(HttpParty.new, FileLogger.new('tmp/logs.txt'))
proxy.get('some.api.com', [])
