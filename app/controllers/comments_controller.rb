class CommentsController < ApplicationController
  include CommentsHelper
  include ArticlesHelper

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

  def update
    respond_to do |format|
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      ## HTML
      authenticate_user!
      if @comment.can_user_edit?(current_user)
        # User can edit
        if @comment.update(comment_params)
          format.html {
            flash[:success] = "Comment updated!"
            redirect_to @comment
          }
          format.json {
            render json: ActiveSupport::JSON.encode({
                commentAnchor: anchor_id(@comment),
                content: markdown(@comment.body, header_level: 2, allow_headers: true)
              })
          }
        else
          format.html {
            flash[:error] = "Problem with the form"
            redirect_to @comment
          }
          format.json {}
        end
      else
        # No permission

        format.html {
          flash[:error] = "You don't have permission to edit this comment."
          redirect_to @comment
        }
        format.json {}
      end
    end
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
