class AddLatAndLonToUsers < ActiveRecord::Migration

  def change
    remove_column :users, :location, :string
    add_column :users, :latitude, :decimal, precision: 5, scale: 2
    add_column :users, :longitude, :decimal, precision: 5, scale: 2  
  end

end
