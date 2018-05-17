class ArticlesController < ApplicationController
  # List of all articles
  def index
    @articles = Article.all
  end

  # Show an article from the id in the URI
  def show
    @article = Article.find(params[:id])
  end

  # New article form
  def new
    authenticate_user!
    if Article.can_user_create?(current_user)
      @article = Article.new
    else
      flash[:error] = "You don't have permission to create posts."
      redirect_to articles_path
    end
  end

  # Edit articles
  def edit
    authenticate_user!
    @article = Article.find(params[:id])
    if @article.can_user_edit?(current_user)
      # Good.
    else
      flash[:error] = "You don't have permission to edit this post."
      redirect_to @article
    end
  end

  # Send new article info to database
  def create
    authenticate_user!
    if Article.can_user_create?(current_user)
      @article = Article.new(article_params)
      @article.author = current_user
      if @article.save
        flash[:success] = "Blog post successfully created!"
        redirect_to @article
      else
        flash[:error] = "Problem with the form! What is it?"
        render 'new'
      end
    else
      flash[:error] = "You don't have permission to create posts."
      redirect_to articles_path
    end
  end

  # Update article text
  def update
    authenticate_user!
    @article = Article.find(params[:id])
    if @article.can_user_edit?(current_user)
      if @article.update(article_params)
        flash[:success] = "Post successfully updated!"
        redirect_to @article
      else
        flash[:error] = "Problem with the form! What is it?"
        render 'edit'
      end
    else
      flash[:error] = "You don't have permission to edit this post."
      redirect_to @article
    end
  end

  # Delete article
  def destroy
    authenticate_user!
    @article = Article.find(params[:id])
    if @article.can_user_delete?(current_user)
      @article.destroy
      flash[:success] = "Post successfully deleted!"
      redirect_to articles_path
    else
      flash[:error] = "You don't have permission to delete this post."
    end
  end

  private
    # Reuseable: List of parameters that exist in the articles database.
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
