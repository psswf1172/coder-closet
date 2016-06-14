class CreateHoodies < ActiveRecord::Migration
  def change
    create_table :hoodies do |t|
      t.string :name
      t.string :color
      t.boolean :worn

      t.timestamps null: false
    end
  end
end
