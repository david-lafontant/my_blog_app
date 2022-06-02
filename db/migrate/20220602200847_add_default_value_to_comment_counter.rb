class AddDefaultValueToCommentCounter < ActiveRecord::Migration[7.0]
  def change
  end

  def self.up
    change_column :posts, :commentsCounter, :integer, :default => 0, :nil => false
  end
end
