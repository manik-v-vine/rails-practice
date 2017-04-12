class AddState < ActiveRecord::Migration[5.0]
  def up
  	add_column :addresses, :state, :string, :limit => 12
  end
  def down
  	remove_column :addresses, :state
  end
end
