class User < ActiveRecord::Base

  has_secure_password

  has_many :books

  has_many :trades

  #has_many :open_trades, class_name:'Trade', foreign_key: :posting_user_id

  #has_many :completed_trades, class_name:'Trade', foreign_key: :receiving_user_id

  #has_many :posted_books, class_name:'Book', foreign_key: :user_id

end
