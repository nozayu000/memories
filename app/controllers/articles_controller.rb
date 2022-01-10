class ArticlesController < ApplicationController
  before_action :login_required

  def new
    @article = Article.new
  end

  def create
    # articleかも
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "記事を投稿しました。"
    else
      render "new"
    end
  end

  def index
    # idの降順で表示
    @articles = Article.all.order(id: "DESC")
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
      redirect_to article_path(article)
    end
  end
  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

end
