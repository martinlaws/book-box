class BetterLocations < ActiveRecord::Migration
  def change

    add_column :locations, :user_id, :integer

    remove_column :users, :latitude, :float
    remove_column :users, :longitude, :float
  end
end
