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
    @comment = @article.comments.create(comment_params)
    @comment.author = current_user
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
