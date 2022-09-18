# abstract
class CustomLogger

  def initialize(path_to_write)
    @path = path_to_write
  end

  def write_logs
    # code to write to concrete path
  end
end

# abstract
class CustomLoggerFactory
  def create_custom_logger(path)
    #code
  end
end

class FileLogger < CustomLogger

  def write_logs
    # code to write logs to file
  end
end

class DatadogLogger < CustomLogger

  def write_logs
    # code to send logs to DD
  end
end

class DatadogLoggerFactory < CustomLoggerFactory

  def create_custom_logger(path = 'datadog.logs.receiver')
    DatadogLogger.new(path)
  end
end

class FileLoggerFactory < CustomLoggerFactory

  def create_custom_logger(path = 'tmp/logs.txt')
    FileLogger.new(path)
  end
end

def client_code(creator)
  print "Client: I'm not aware of the creator's class, but it still works.\n"\
        "#{creator.create_custom_logger}"
end

client_code(DatadogLoggerFactory.new)
