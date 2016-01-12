class Fukuokacomment < ActiveRecord::Base
  belongs_to :fukuokapost
  belongs_to :student
end
