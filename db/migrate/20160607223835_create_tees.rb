class CreateTees < ActiveRecord::Migration
  def change
    create_table :tees do |t|
      t.string :name
      t.string :color
      t.boolean :worn

      t.timestamps null: false
    end
  end
end
