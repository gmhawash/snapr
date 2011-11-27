class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :set_context


  def set_context
    GlobalContext.set(request)
    GlobalContext.user = current_user
  end
end
