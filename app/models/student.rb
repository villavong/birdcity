class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :photo, styles: { :large => "1000x1000#", :medium => "550x550#" }


  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  has_many :eastposts
  has_many :eastcomments

  has_many :beppuposts
  has_many :beppucomments


  has_many :southposts
  has_many :southcomments

  has_many :otherposts
  has_many :othercomments
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
