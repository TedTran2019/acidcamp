class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Resource simply refers to the User model
  def after_sign_in_path_for(_resource)
    # if resource.has_role? :super_admin -> admin dashboard
    # Page they were previously looking at -> projects page -> root
    if session[:return_to]
      tmp = session[:return_to]
      session[:return_to] = nil
      return tmp
    end
    projects_url || root_url
  end

  def redirect_if_signed_in
    redirect_to projects_url if user_signed_in?
  end

  # Eh, don't need to bother with this since they're any pages anyway lol.
  def store_location
    session[return_to] = request.referer
  end

  private

  def user_not_authorized
    flash[:notice] = 'Sorry, not authorized'
    redirect_to(request.referer || root_path)
  end
end
