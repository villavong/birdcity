class Beppucomment < ActiveRecord::Base
  belongs_to :beppupost
  belongs_to :student
end
