class PostsController < ApplicationController
  before_action :login_required
  
  def new
    @post = Post.new
  end 
  
  def create
    # postかも
    @post = Post.new(post_params)
    if post.save
      redirect_to post_path(post.id), notice: "記事を投稿しました。"
    else
      render "new"
    end
  end
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      redirect_to post_path(post)
    end
  end
  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
