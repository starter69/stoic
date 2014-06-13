class CreateDoctrines < ActiveRecord::Migration
  def change
    create_table :doctrines do |t|
      t.string :title
      t.text :explanation
      t.string :category

      t.timestamps
    end
  end
end
