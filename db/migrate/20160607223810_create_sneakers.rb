class CreateSneakers < ActiveRecord::Migration
  def change
    create_table :sneakers do |t|
      t.string :name
      t.string :color
      t.boolean :worn

      t.timestamps null: false
    end
  end
end
