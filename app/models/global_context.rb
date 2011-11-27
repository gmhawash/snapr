class GlobalContext
  # In case methods are called on GlobalContext when it has not been set up (such as
  # from shell scripts or tests), an instance of this class provides the default
  # request data.
  attr_accessor :password_reset

  class NullRequest
    attr_accessor :host
    attr_accessor :url
    attr_accessor :query_string
    attr_accessor :remote_ip
    attr_accessor :path

    def parameters
      @parameters ||= {}
    end

    def session
      @session ||= {}
    end

    def env
      @env ||= {}
    end

    def url
      @url ||= ''
    end
  end

  # Roll-your-own singleton behavior!
  private_class_method :new
  def self.instance
    @instance ||= new
  end

  def initialize(*params)
    set(*params)
  end

  def self.set(*params)
    @instance = new(*params)
  end

  def set(request)
    if request.kind_of?(Hash)
      raise ArgumentError, "GlobalContext#set now takes a Request object as its " \
        + "sole argument, but it looks like you are still calling it the " \
        + "old way (with a session hash)."
    end
    @request = request
  end

  # Look, this class behaves just like a module with module_method at the top!
  def self.method_missing(meth, *args, &block)
    instance.send(meth, *args, &block)
  end

  def authenticated?
    user && !user.anonymous?
  end

  def website
    @website ||= Website.find_by_url(http_host)
  end

  def http_host
    @http_host ||= "%s%s:%s" % [@request.protocol, @request.host, @request.port] 
  end

  def http_host=(hostname)
    @http_host = hostname
  end

  def set_site(site_alias)
    @website = Website.find_by_alias(site_alias) || website
  end

  def location=(location)
    session['location'] = location
  end

  def production_environment?
    rails_environment == 'production'
  end

  def rails_environment
    Rails.env || 'production'
  end

  def request
    @request
  end

  def request_url
    @request_url ||= @request.url.gsub('?%s' % @request.query_string, '')
  end

  def test_environment?
    ['test', 'webrat', 'selenium', 'external_webrat', 'external_selenium', 'cucumber'].include?(Rails.env)
  end

  def session
    @request.session
  end


  def user
    @user ||= User.find_by_id(session[:current_user_id]) if session[:current_user_id]
  end

  def user=( user )
    case user
    when nil
      session[ :current_user_id ] = nil
      @user = nil
    when User
      session[ :current_user_id ] = user.id
      @user = user
    else
      raise 'attempted to assign a value other than a User object to GlobalContext.user'
    end
  end
end
