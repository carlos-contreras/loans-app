class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :loan, null: false, foreign_key: true
      t.integer :status, default: 0
      t.text :note
      t.decimal :principal_amount
      t.decimal :interest_amount

      t.timestamps
    end
  end
end
