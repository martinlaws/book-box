class AddUsersAndBooksToTrades < ActiveRecord::Migration

  def change
    add_column :trades, :posting_user, :integer
    add_column :trades, :receiving_user, :integer
    add_column :trades, :book_id, :integer
  end

end
