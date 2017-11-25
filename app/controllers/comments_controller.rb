class CommentsController < ApplicationController
  def create
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = @blog_post.comments.create(set_comment)
    redirect_to blog_post_path(@blog_post)
  end

  def destroy
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = @blog_post.comments.find(params[:id])
    @comment.destroy
    redirect_to blog_post_path(@blog_post)
    end
  end
  end

  def update
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = @blog_post.comments.find(params[:id])
    @comment.update(set_comment)
    redirect_to blog_post_path(@blog_post)
  end

  private

  def set_comment
    params[:comment].permit(:author, :comment_entry)
  end
end
