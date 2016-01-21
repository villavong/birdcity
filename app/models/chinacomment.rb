class Chinacomment < ActiveRecord::Base
  belongs_to :chinapost
  belongs_to :student
end
