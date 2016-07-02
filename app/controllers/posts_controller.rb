class PostsController < ApplicationController
before_action :authenticate_user!,except:[:index, :show]
load_and_authorize_resource


  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.image = params[:image]
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
     @post = Post.find(params[:id])
     @post.user_id = current_user.id
  end

  def update
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    @post.save
    if @post.update(params[:post].permit(:title, :body, :image,:remove_image,:remote_image_url))
      redirect_to @post
    else
      render 'edit'
    end
  end


  def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

  private
    def post_params
      params.require(:post).permit(:title, :body, :id,:image,:remove_image,:remote_image_url,:user_id)
    end
end
