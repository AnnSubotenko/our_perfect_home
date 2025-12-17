class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.references :household, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.text :notes

      t.timestamps
    end
  end
end
