class User < ActiveRecord::Base

  has_many :open_trades, class_name:'Trade', foreign_key: :posting_user_id

  has_many :completed_trades, class_name:'Trade', foreign_key: :receiving_user_id

  has_many :posted_books, class_name:'Book', foreign_key: :posting_user_id

end
