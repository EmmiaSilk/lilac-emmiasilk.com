class RenameArticleTextToBody < ActiveRecord::Migration[5.2]
  def up
    change_table :articles do |t|
      t.rename :text, :body
    end
  end
  def down
    change_table :articles do |t|
      t.rename :body, :text
    end
  end
end
