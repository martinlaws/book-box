class User < ActiveRecord::Base

  has_secure_password

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

  def get_location
    location = cookies[:lat_lng].split("|")
    location
  end

  def location
    "#{latitude}, #{longitude}"
  end

  def acceptable_range
    5
  end

  def within_range?(other_user)
    distance = Haversine.distance(other_user.latitude, other_user.longitude, latitude, longitude)
    distance.to_km <= acceptable_range  
  end

end
