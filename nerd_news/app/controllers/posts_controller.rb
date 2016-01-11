class PostsController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!

  def index
    @posts = Post.all.order(created_at: :desc)

    respond_with @posts
  end

  def show
    @post = Post.find(params[:id])

    respond_with @post
  end

  def new
    @post = current_user.posts.new
    authorize @post
  end

  def create
    @post = current_user.posts.new(post_params)

    authorize @post

    if @post.save
      flash[:success] = 'Created Post'
    end

    respond_with @post
  end

  def edit
    @post = current_user.posts.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    flash[:success] = 'Updated Post' if @post.update(post_params)
    respond_with @post
  rescue ActiveRecord::StaleObjectError
    @post.reload
    render 'conflict'
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    authorize @post

    @post.user_id == current_user[:id] ? @post.destroy : flash[:danger] = 'Cant delete other peoples posts'

    flash[:success] = 'Deleted Post' if @post.destroyed?
    respond_with @post
  end

  private

  def post_params
    params.require(:post).permit(:url, :headline, :lock_version, :description)
  end
end
