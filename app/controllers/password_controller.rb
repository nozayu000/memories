class PasswordController < ApplicationController
  before_action :login_required
  
  def show
    redirect_to :myaccount  
  end
  
  def edit
    @member = current_member
  end 
  
  def update
    @member = current_member
    @member.current_password = params[:myaccount][:current_password]
    
    if current_password.present?
      # 現在のパスが正しいか確認
      if @member.authenticate(current_password)
        # 正しい場合変更
        @member.update(params[:myaccount])
        if @member.save
          redirect_to myaccount_path, notice: "パスワードを変更しました。"
        else 
          render "edit"
        end
      else
        # 誤りの場合
        @member.errors.add(:current_password, :wrong)
        render "edit"
      end
    else
      # 新しいパスが空の場合
      @member.errors.add(:current_password, :empty)
      render "edit"
    end
  end 
end
