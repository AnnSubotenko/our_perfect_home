class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.references :household, null: false, foreign_key: true
      t.string :name
      t.string :kind

      t.timestamps
    end
  end
end
