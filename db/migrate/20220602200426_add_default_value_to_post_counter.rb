class AddDefaultValueToPostCounter < ActiveRecord::Migration[7.0]

  def self.up
    change_column :users, :post_counter, :integer, :default => 0, :nil => false
  end

end
