class CreatePaymentUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_updates do |t|
      t.references :payment, null: false, foreign_key: true
      t.integer :status
      t.text :note

      t.timestamps
    end
  end
end
