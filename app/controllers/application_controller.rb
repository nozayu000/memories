class ApplicationController < ActionController::Base

  private

  def current_member
    if session[:member_id]
      Member.find_by(id: session[:member_id])
    end
    helper_method :current_member
  end
end
