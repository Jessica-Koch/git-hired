class EditUserTable < ActiveRecord::Migration
  def change
    remove_column :users, :description
    add_column :users, :bio, :string
  end
end
