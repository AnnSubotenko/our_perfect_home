class CreateDocuments < ActiveRecord::Migration[7.2]
  def change
    create_table :documents do |t|
      t.references :household, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :bill, null: false, foreign_key: true
      t.string :title
      t.date :document_month
      t.string :original_filename
      t.bigint :file_size_bytes

      t.timestamps
    end
  end
end
