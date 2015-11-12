class Book < ActiveRecord::Base

  validates :title, :author, :genre, presence: true

  has_many :trades
  belongs_to :user

end
