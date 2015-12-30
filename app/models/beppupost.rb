class Beppupost < ActiveRecord::Base
  belongs_to :student
  has_many :beppucomments
end
