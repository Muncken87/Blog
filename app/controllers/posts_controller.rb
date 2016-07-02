class PostsController < ApplicationController
before_action :authenticate_user!,except:[:index, :show]


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
    @post = current_user.posts.new(post_params)
    @post.image = params[:image]
    @post.user_id = current_user
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
     @post = Post.find(params[:id])
    # current_user.posts.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.save
    if @post.update(params[:post].permit(:title, :body, :image,:remove_image,:remote_image_url,:user_id))
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
