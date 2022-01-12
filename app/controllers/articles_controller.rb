class ArticlesController < ApplicationController
  # except:コールバック対象外
  before_action :login_required,except: [:index, :show]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "記事を投稿しました"
    else
      render "new"
    end
  end

  def index
    # idの降順で表示[.order(id: "DESC")]=>asc昇降と迷った場合には
    # reverse_order(新着順）を使用
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
    @article.update(article_params)
    if @article.save
      redirect_to @article, notice: "記事を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to @article, notice: "記事を削除しました"
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :image)
  end
end