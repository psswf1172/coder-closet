class CreateJeans < ActiveRecord::Migration
  def change
    create_table :jeans do |t|
      t.string :name
      t.string :color
      t.boolean :worn

      t.timestamps null: false
    end
  end
end
