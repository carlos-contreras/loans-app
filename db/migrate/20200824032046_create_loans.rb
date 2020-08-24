class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0
      t.decimal :initial_amount, null: false
      t.integer :interest_type, default: 0
      t.decimal :interest_rate, null: false
      t.integer :period_type, default: 0
      t.integer :periods_count, null: false
      t.timestamp :disbursed_at
      t.integer :pay_day_deadline

      t.timestamps
    end
  end
end
