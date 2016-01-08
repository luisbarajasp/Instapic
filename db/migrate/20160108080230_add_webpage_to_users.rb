class AddWebpageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :webpage, :string
  end
end
