class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :photo, styles: { :large => "1000x1000#", :medium => "550x550#" }


  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/


  has_many :missions

  has_many :fukuokaposts, :dependent => :delete_all
  has_many :fukuokacomments


  has_many :tokyoposts, :dependent => :delete_all
  has_many :tokyocomments

  has_many :osakaposts, :dependent => :delete_all
  has_many :osakacomments

  has_many :eastposts, :dependent => :delete_all
  has_many :eastcomments

  has_many :beppuposts, :dependent => :delete_all
  has_many :beppucomments


  has_many :southposts, :dependent => :delete_all
  has_many :southcomments

  has_many :otherposts, :dependent => :delete_all
  has_many :othercomments

  has_many :chinaposts, :dependent => :delete_all
  has_many :chinacomments

  has_many :thaiposts, :dependent => :delete_all
  has_many :thaicomments

  has_many :vietposts, :dependent => :delete_all
  has_many :vietcomments


  has_many :studentcomments, :dependent => :delete_all



  def self.search(query)
      if query.present?
        # where("name like :q", q: "%#{query}%")
        # where("name ilike :q or description ilike :q or ship ilike :q", q: "%#{query}%")
        # where("name @@ :q or description @@ :q or ship @@ :q", q: query)
        rank = <<-RANK
          ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize(query)})) +
          ts_rank(to_tsvector(city), plainto_tsquery(#{sanitize(query)})) +
          ts_rank(to_tsvector(school), plainto_tsquery(#{sanitize(query)}))
        RANK
        where("name @@ :q or city @@ :q or nationality @@ :q or major @@ :q or school @@ :q or introduction @@ :q", q: query).order("#{rank} desc")
      else
        all
      end
  end





  def birdtype
    if self.beppuposts.count + self.eastposts.count + self.southposts.count + self.otherposts.count  <= 2
      return :egg
    elsif self.beppuposts.count + self.eastposts.count + self.southposts.count + self.otherposts.count <=4
      return :pigeon
    elsif self.beppuposts.count + self.eastposts.count + self.southposts.count + self.otherposts.count <=20
      return :eagle
    elsif self.beppuposts.count + self.eastposts.count + self.southposts.count + self.otherposts.count <=50
      return :condor
    elsif self.beppuposts.count + self.eastposts.count + self.southposts.count + self.otherposts.count <=100
      return :albatross

    end
  end
end
