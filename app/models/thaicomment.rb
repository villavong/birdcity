class Thaicomment < ActiveRecord::Base
  belongs_to :thaipost
  belongs_to :student
end
