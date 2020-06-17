class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

  #Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end
end
