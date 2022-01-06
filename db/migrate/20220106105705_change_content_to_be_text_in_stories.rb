class ChangeContentToBeTextInStories < ActiveRecord::Migration[6.1]
  def up
    change_column :stories, :content, :text
  end

  def down
    change_column :stories, :content, :string
  end
end
