class AddStatusToTrade < ActiveRecord::Migration
  def change
    add_column :trades, :status, :string, default: "pending"
  end
end
