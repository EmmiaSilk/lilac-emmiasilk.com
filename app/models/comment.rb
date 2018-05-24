class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :author, class_name: "User"

  validates_presence_of :author_id
  validates_presence_of :article_id
  validates_presence_of :body

  # Comment permission policies
  def can_user_edit?(user)
    return user == author || user.admin?
  end
  def can_user_delete?(user)
    return user == author || user.poster? || user.admin?
  end
end
