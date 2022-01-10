class BlogsController < ApplicationController
  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params[:blog])
    @blog.id = current_member.id
    if @blog.save
      redirect_to @blog, notice: "記事を作成しました"
    else
      render "new"
    end
  end

  def index
    # ◯◯さん(member)の記事(blog)があれば@blogsに格納
    if params[:member_id]
      @member = Member.find(params[:member_id])
      @blogs = @member.blogs
    else
    # 特定の会員の記事がなければ全て抽出し格納
      @blogs = Blog.all
    end
    @blogs = @blogs.page(params[:page]).reverse_order
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = current_member.blogs.find(params[:id])
  end

  def update
    @blog = current_member.blogs.find(params[:id])
    @blog.update(params[:blog])
    if @blog.save
      redirect_to @blog, notice: "記事を変更しました"
    else
      render "edit"
    end
  end

  def destroy
    @blog = current_member.blogs.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: "メンバーを削除しました"
  end

end
