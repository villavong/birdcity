class Beppupost < ActiveRecord::Base
  belongs_to :student
  has_many :beppucomments, :dependent => :delete_all

  has_attached_file :photo, styles: { :large => "1000x1000#", :medium => "550x550#" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  def self.search(query)
      if query.present?
        # where("name like :q", q: "%#{query}%")
        # where("name ilike :q or description ilike :q or ship ilike :q", q: "%#{query}%")
        # where("name @@ :q or description @@ :q or ship @@ :q", q: query)
        rank = <<-RANK
          ts_rank(to_tsvector(title), plainto_tsquery(#{sanitize(query)}))

        RANK
        where("title @@ :q", q: query).order("#{rank} desc")
      else
        all
      end
  end

end
