class BlogPostsController < ApplicationController

	before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

  def index
  	@blog_posts = BlogPost.all
  end

  def show
  end

  def new
  	@blog_post = BlogPost.new
  end

  def edit
  end

  def create
  	@blog_post = BlogPost.new(blog_post_params)
  	respond_to do |format|
  		if @blog_post.save
  			format.html {redirect_to blog_post_url(@blog_post), notice: "Post created!!"}
  		else
  			format.html {render :new}
  		end
  	end
  end

  def update
  	respond_to do |format|
  		if @blog_post.update(blog_post_params)
  			format.html {redirect_to blog_post_url(@blog_post), notice: "Post was created!!"}
  		else
  			format.html {render :edit}
      end
    end
  end

  def destroy
  	@blog_post.destroy
  	respond_to do |format|
  		format.html {redirect_to blog_posts_url, notice: "Post Deleted!!"}
  	end
  end

  private

  def set_blog_post
  	@blog_post = BlogPost.find(params[:id])
  end

  def blog_post_params
  	params.require(:blog_post).permit(:title, :author, :blog_entry)
  end
end
 