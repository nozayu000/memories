class MembersController < ApplicationController
  # 会員一覧
  def index
    @members = Member.order(params[:id])
  end

  #会員情報の詳細
  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new(birthday: Date.new(1990, 1, 1))
  end

  def edit
    @member = Member.find(params[:id])
  end
  # 会員の新規登録
  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to @member, notice: "会員登録しました"
    else
      render "new"
    end
  end

  def update
    @member = Member.find(params[:id])
    @member.update(params[:member])
    if @member.save
      redirect_to @member, notice: "会員情報を更新しました"
    else
      render "edit"
    end 
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :member, notice: "会員を削除しました"
  end

  def search
    @members = Member.search(params[:q])
    render "index"
  end

end
