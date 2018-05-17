class ChangeCommentWriterToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :commenter, :string
    add_reference :comments, :author, foriegn_key: true, index: true 
  end
end
