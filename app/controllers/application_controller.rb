class ApplicationController < ActionController::Base

  private

  def current_member
    if session[:member_id] then
      Member.find_by(id: session[:member_id])
    end
  end
  # 引数に指定された名前のメソッドをテンプレートでも
  # 使用できるようにするヘルパーメソッド
  helper_method :current_member

  class LoginRequired < StandardError; end
  class Fobidden < StandardError;end

  private

  def login_required
    raise LoginRequired unless current_member
  end
end
