class Tokyocomment < ActiveRecord::Base
  belongs_to :tokyopost
  belongs_to :student
end
