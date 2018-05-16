class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :author, class_name: "User"

  def can_user_delete?(user)
    return user == author
  end
end
