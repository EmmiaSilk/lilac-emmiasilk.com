class AddAuthorToArticles < ActiveRecord::Migration[5.2]
  def change
      add_reference :articles, :author, foreign_key: true, index: true
  end
end
