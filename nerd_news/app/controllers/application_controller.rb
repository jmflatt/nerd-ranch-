class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize(record)
    policy(record).authorize(params[:action])
  end

  def policy(record)
    Policy.for(record, current_user)
  end

  helper_method :policy
end
