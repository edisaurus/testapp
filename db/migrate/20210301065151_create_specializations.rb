class CreateSpecializations < ActiveRecord::Migration[6.1]
  def change
    create_table :specializations do |t|

      t.string :branch
      t.text :description
      t.integer :engineering_id

      t.timestamps
    end
  end
end
