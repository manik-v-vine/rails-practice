class AddState < ActiveRecord::Migration
  def up
  	add_column :addresses, :state, :string, :limit => 12
  end
  def down
  	remove_column :addresses, :state
  end
end
