class User < ActiveRecord::Base

  has_secure_password

  has_many :books

  has_many :trades

  def get_trades
    posting_trades + receiving_trades
  end

  def posting_trades
    Trade.where(posting_user: id)
  end

  def receiving_trades
    Trade.where(receiving_user: id)
  end

  #has_many :open_trades, class_name:'Trade', foreign_key: :posting_user_id

  #has_many :completed_trades, class_name:'Trade', foreign_key: :receiving_user_id

  #has_many :posted_books, class_name:'Book', foreign_key: :user_id

end
