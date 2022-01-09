class MyaccountsController < ApplicationController
  before_action :login_required
  
  def show
    @member = current_member
    
  end

  def edit
    @member = current_member
  end
  
  def update
    @member = current_member
    @member.update(params[:myaccount])
    if @member.save
      redirect_to :myaccount, notice: "マイページを編集しました。"
    else
      render "edit"
    end 
  end 

end


