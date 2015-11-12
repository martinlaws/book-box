class Book < ActiveRecord::Base

  has_many :trades
  belongs_to :user

end
