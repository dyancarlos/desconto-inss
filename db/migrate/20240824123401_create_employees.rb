class CreateEmployees < ActiveRecord::Migration[7.2]
  def change
    create_table :employees do |t|
      # Personal Information
      t.string :name, null: false
      t.string :cpf, null: false
      t.date :birthdate, null: false
      t.integer :salary, null: false, default: 0
      t.integer :social_security_discount, null: false, default: 0

      # Address
      t.string :street_name
      t.integer :street_number
      t.string :district
      t.string :city
      t.string :state
      t.string :zipcode

      # Phones
      t.string :personal_phone, null: false
      t.string :reference_phone

      # Timestamp
      t.timestamps
    end
  end
end