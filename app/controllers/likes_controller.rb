class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @likes = Like.all
    respond_with(@likes)
  end

  def show
    respond_with(@like)
  end

  def new
    @like = Like.new
    respond_with(@like)
  end

  def edit
  end

  def create

    @like = Like.new
    if current_user then
          @like.post_id = params[:id]
          @like.save
            redirect_to post_path(Post.find(params[:id]))
    else
        redirect_to post_path(Post.find(params[:id]))
    end

  end

  def update
    @like.update(like_params)
    respond_with(@like)
  end

  def destroy
    @post =Post.find(params[:post_id])
    @like.destroy
    respond_with(@like)
    redirect_to post_path(@post)
  end

  private
    def set_like
      @like = Like.find(params[:id])
    end

    def like_params
      params.require(:like).permit()
    end
end
