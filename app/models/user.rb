class User < ActiveRecord::Base
  validates_presence_of :username, :password
  validates :username, uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :sightings
  has_many :birds, through: :sightings

  # add avatar to database
  
  def slug 
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|username| username.slug == slug}
  end
end