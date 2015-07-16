class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :id
      t.string :name

      t.timestamps null: false
    end
  end
end
