class Vietcomment < ActiveRecord::Base
  belongs_to :vietpost
  belongs_to :student
end
