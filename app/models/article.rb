class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}

  # Returns the article created after this one, or the current
  # article if none exists.
  def next_article
    list = Article.where('created_at > ?', created_at)
    article = list.order('created_at ASC').first()
    if article != nil
      return article
    else
      return self
    end
  end

  # Returns the article created after this one, or the current
  # article if none exists.
  def previous_article
    list = Article.where('created_at < ?', created_at)
    article = list.order('created_at DESC').first()
    if article != nil
      return article
    else
      return self
    end
  end
end
