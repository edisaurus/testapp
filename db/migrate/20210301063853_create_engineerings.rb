class CreateEngineerings < ActiveRecord::Migration[6.1]
  def change
    create_table :engineerings do |t|

      t.string :subject
      t.text :description
      t.integer :units
      t.boolean :seasonal
      
      t.timestamps
    end
  end
end
