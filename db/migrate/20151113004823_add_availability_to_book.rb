class AddAvailabilityToBook < ActiveRecord::Migration

  def change
    add_column :books, :availability, :boolean, default: true  
  end

end
