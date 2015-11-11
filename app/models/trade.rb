class Trade < ActiveRecord::Base

  belongs_to :posting_user, class_name:'User'

  belongs_to :receiving_user, class_name:'User'

end
