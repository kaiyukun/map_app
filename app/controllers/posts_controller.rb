class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def home
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to :action => "show", :id => @post.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to action: :index
  end

  private
  def post_params
    params.require(:post).permit(:name, :image, :content, :address, :latitude, :longitude, :user_id, :rink, :place)
  end
end
