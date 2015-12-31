class Eastcomment < ActiveRecord::Base
  belongs_to :eastpost
  belongs_to :student
end
