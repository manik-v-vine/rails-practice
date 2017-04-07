class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
			t.string :first_name
			t.string :last_name
			t.string :email
			t.date :dob
			t.boolean :active 
			t.string :phone_no 
			t.string :mobile_no 
			t.timestamps
    end
  end

  def down
  	drop_table :users 
  end
end
