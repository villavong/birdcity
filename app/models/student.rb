class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_attached_file :photo, styles: { :large => "1000x1000#", :medium => "550x550#" }
   validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
   searchkick




   def search_data
     {
       name: name,
       email: email,
       school: school,
       introduction: introduction,
       city: city,
       major: major,
       nationality: nationality
     }
   end


   def birdtype
    # if self.beppuposts.count + self.eastposts.count + self.southposts.count + self.otherposts.count  <= 2
    #   return :egg
    # elsif self.beppuposts.count + self.eastposts.count + self.southposts.count + self.otherposts.count <=4
    #   return :pigeon
    # elsif self.beppuposts.count + self.eastposts.count + self.southposts.count + self.otherposts.count <=20
    #   return :eagle
    # elsif self.beppuposts.count + self.eastposts.count + self.southposts.count + self.otherposts.count <=50
    #   return :condor
    # elsif self.beppuposts.count + self.eastposts.count + self.southposts.count + self.otherposts.count <=100
    #   return :albatross

    # end
  end


end
