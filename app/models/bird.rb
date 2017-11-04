class Bird < ActiveRecord::Base
has_many :sightings
has_many :users, through: :birds


 def slug 
    username.downcase.gsub(" ","+")
  end

  def self.find_by_slug(slug)
    User.all.find{|username| username.slug == slug}
  end
end