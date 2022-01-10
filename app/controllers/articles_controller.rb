class ArticlesController < ApplicationController
  before_action :login_required,except: [:index, :show]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to @article, notice: "記事を投稿しました"
    else
      render "new"
    end
  end

  def index
    # idの降順で表示
    @articles = Article.page(params[:page]).reverse_order
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(params[:article])
    if @article.save
      redirect_to @article, notice:"記事を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to @article, notice: "記事を削除しました"
  end

end