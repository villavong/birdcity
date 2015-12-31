class Southcomment < ActiveRecord::Base
  belongs_to :southpost
  belongs_to :student
end
