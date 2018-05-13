module CommentsHelper
  def anchor_id(comment)
    "comment-" + comment.article.id.to_s + "-" + comment.id.to_s
  end
end
