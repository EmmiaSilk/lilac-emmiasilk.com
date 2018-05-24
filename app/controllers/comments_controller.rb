class CommentsController < ApplicationController
  include CommentsHelper

  def index
    @article = Article.find(params[:article_id])
    redirect_to article_path(@article)
  end

  def show
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    redirect_to article_path(@article, :anchor => anchor_id(@comment))
  end

  def create
    @article = Article.find(params[:article_id])
    authenticate_user!
    if @article.can_user_add_comment?(current_user)
      @comment = @article.comments.create(comment_params)
      @comment.author = current_user
      @comment.save
      flash[:success] = "Successfully posted a comment!"
    else
      flash[:error] = "You must log in to post a comment."
    end
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    # User must be either admin or comment creator.
    authenticate_user!
    if @comment.can_user_delete?(current_user)
      @comment.destroy
      flash[:success] = "Comment successfully deleted."
    else
      flash[:error] = "You don't have permission to delete this comment."
    end

    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
