class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    p
    logger.debug
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    blog =Blog.new(blog_params)
    binding.pry
    blog.save
    redirect_to blog_path(blog.id)
  end

  def edit
    @blog =Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end
end
