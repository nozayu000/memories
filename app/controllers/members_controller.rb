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

  def create
  end

  def update
  end

  def def destroy
  end

  def search
    @members = Member.search(params[:q])
    render "index"
  end 

end
