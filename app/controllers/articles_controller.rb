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
    @article = Article.new
  end

  # Edit articles
  def edit
    @article = Article.find(params[:id])
  end

  # Send new article info to database
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  # Update article text
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  # Delete article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    # Reuseable: List of parameters that exist in the articles database.
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
