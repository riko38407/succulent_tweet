class CreatePictorialBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :pictorial_books do |t|

      t.timestamps
    end
  end
end
