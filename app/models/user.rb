class User < ActiveRecord::Base
  validates_presence_of :username, :password
  validates_uniqueness_of :username
  has_secure_password
  has_many :sightings
  has_many :birds, through: :sightings

  def slug 
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|username| username.slug == slug}
  end
end