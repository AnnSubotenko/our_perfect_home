class CreateBills < ActiveRecord::Migration[7.2]
  def change
    create_table :bills do |t|
      t.references :household, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.integer :amount
      t.string :currency
      t.date :due_on
      t.string :status
      t.date :paid_on
      t.text :notes

      t.timestamps
    end
  end
end
