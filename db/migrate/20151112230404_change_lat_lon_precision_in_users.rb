class ChangeLatLonPrecisionInUsers < ActiveRecord::Migration

  def change
    change_column :users, :latitude, :decimal, precision: 7, scale: 4
    change_column :users, :longitude, :decimal, precision: 7, scale: 4   
  end

end
