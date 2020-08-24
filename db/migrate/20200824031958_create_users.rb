class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :role, default: 0
      t.string :email, null: false
      t.string :full_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :zip_code
      t.string :mobile_phone

      t.timestamps
    end
  end
end
