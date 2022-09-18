# Template
class TemplateEngine
  def render_skeleton
    init_engine
    preload_scripts
    load_scripts
    afterload_scripts
    before_controller_init
    init_controller
    after_controller_init
  end

  def init_engine
    # init engine
  end

  def init_controller
    # code for init
  end

  def preload_scripts
    # preloading scripts...
  end

  def load_scripts
    # loading_scripts
  end

  def afterload_scripts
    # after scripts loaded
  end

  def before_controller_init
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def after_controller_init
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class TemplateLogger < TemplateEngine
  def before_controller_init
    # create logs and write loading time for metrics
  end

  def after_controller_init
    # create logs and write loading time for metrics
  end
end

class LibLoader < TemplateEngine
  def before_controller_init
    # load some lib between engine hooks
  end

  def preload_scripts
    # preload some scripts for lib to work
  end

  def after_controller_init
    # check if lib is loaded and log error if not
  end
end

def client_code(abstract_class)
  # ...
  abstract_class.render_skeleton
  # ...
end

puts 'Logg events while engine init'
client_code(TemplateLogger.new)

puts 'Loads 3rd-party lib while engine init'
client_code(LibLoader.new)
