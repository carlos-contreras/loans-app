class CreateLoanUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :loan_updates do |t|
      t.references :loan, null: false, foreign_key: true
      t.integer :status
      t.text :note

      t.timestamps
    end
  end
end
