class Bird < ActiveRecord::Base
validates_presence_of :species, allow_blank: false
validates_uniqueness_of :species

has_many :sightings
has_many :users, through: :birds


 def slug 
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|username| username.slug == slug}
  end


end