class Trade < ActiveRecord::Base

  belongs_to :user
  belongs_to :book

  validates :receiving_user, uniqueness: {scope: :book_id}

  def complete_trade
    self.status = "completed"
  end

end
