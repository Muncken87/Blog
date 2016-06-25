class PostsController < ApplicationController

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
    @post.save
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.image = params[:image]
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.image.save
    if @post.update(params[:post].permit(:title, :body, :image,:remove_image))
      redirect_to @post
    else
      render 'edit'
    end
  end


  def destroy
		@post = Post.find(params[:id])
    @post.remove_image!
		@post.destroy

		redirect_to posts_path
	end

  private
    def post_params
      params.require(:post).permit(:title, :body, :id,:image,:remove_image)
    end
end
