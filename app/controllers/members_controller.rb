class MembersController < ApplicationController
  before_action :login_required

  def index
    # ページネーション付き
    @members = Member.page(params[:page]).reverse_order

  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new(birthday: Date.new(1990, 1, 1))
  end

  def edit
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(member_params_create)
    if @member.save
      redirect_to @member, notice: "新しいメンバーを登録しました"
    else
      render "new"
    end
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    if @member.save
      redirect_to @member, notice: "メンバー情報を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to members_path, notice: "メンバーを削除しました"
  end

  def search
    @members = Member.search(params[:q])
    render "index"
  end

  private
  def member_params
      params.require(:member).permit(:nickname, :full_name, :birthday, :email, :administrator)
  end

  def member_params_create
      params.require(:member).permit(:nickname, :full_name, :birthday, :email, :public, :password)
  end
end