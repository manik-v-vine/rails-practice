class CreateUser < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
    	t.column "first_name",:string,  :limit => 32, :null => false
    	t.column "last_name",:string, :limit => 32, :null => false
    	t.column  "email", :string, :limit => 128
    	t.column "date_of_birth",:date
    	t.column "active",:boolean
    	t.column  "phone_no",:string, :limit => 12
    	t.column "mobile_no",:string, :limit => 12
        t.timestamps
    end
    create_table :addresses do |t|
    	t.belongs_to :user, index: true
    	t.column "house_no", :string, :limit => 32
    	t.column "street_name", :string, :limit => 32
    	t.column "city", :string, :limit => 32
    	t.column "country", :string, :limit => 32
    end
  end

  def down 
  	drop_table :users
  	drop_table :addresses
  end
end
