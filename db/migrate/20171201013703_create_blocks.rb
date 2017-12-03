class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :key
      t.text :content

      t.timestamps null: false
    end
  end
end
