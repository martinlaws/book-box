class Book < ActiveRecord::Base

  validates :title, :author, :genre, presence: true

  has_many :trades
  belongs_to :user

  def not_owned_by_current_user?(current_user)
    user_id != current_user.id 
  end

  def available
    book.availability = true
  end

  def remove
    book.availability = false
  end

end
