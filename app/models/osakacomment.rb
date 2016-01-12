class Osakacomment < ActiveRecord::Base
  belongs_to :osakapost
  belongs_to :student
end
