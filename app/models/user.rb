class User < ActiveRecord::Base

  has_secure_password

  has_one :location

  has_many :books

  has_many :trades

  validates :first_name, :last_name, :email, :password, presence: true

  validates :email, uniqueness: true

  def get_trades
    posting_trades + receiving_trades
  end

  def posting_trades
    Trade.where(posting_user: id)
  end

  def receiving_trades
    Trade.where(receiving_user: id)
  end

  def set_location(location)
    self.create_location(location)
  end

end
