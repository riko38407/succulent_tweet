class CreatePictorialBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :pictorial_books do |t|
      t.references :user,foreign_key: true
      t.string  :plant_name,null:false 
      t.integer :type_id,null:false
      t.integer :difficulty_id,null:false
      t.text    :cultivation,null: false
      t.date    :data,null: false

      t.timestamps
    end
  end
end
