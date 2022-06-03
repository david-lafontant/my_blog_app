class AddDefaultValueToLikeCounter < ActiveRecord::Migration[7.0]

  def self.up
    change_column :posts, :likesCounter, :integer, :default => 0, :nil => false
  end
end
