class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  #before_action :require_admin, only:[:show, :edit, :update, :destroy]
#  before_action :require_user, only:[:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if  current_user.email=="priyanka.kadam615@gmail.com" then
        if @post.save then
            flash[:success] = "The photo was added!"
            redirect_to posts_path
        end
    else
        flash[:success] = "sorry You are not admin ..!!"
        respond_with(@post)
    end

  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end


    def destroy
    @post = Post.find(params[:id])
      if  current_user.email=="priyanka.kadam615@gmail.com" then
              @post.destroy
              flash[:success] = "The photo was destroyed."
      else
                flash[:success] = "sorry You are not admin ..!!"
      end

    redirect_to posts_path
  end


  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :image)
    end
end
