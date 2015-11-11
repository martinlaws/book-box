class Book < ActiveRecord::Base

  belongs_to :posting_user, class_name:'User'

end
