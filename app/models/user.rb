class User < ActiveRecord::Base
  validates_presence_of :username, :password, allow_blank: false
  validates :username, uniqueness: { case_sensitive: false }
  after_initialize :signed_up
  has_secure_password
  has_many :sightings
  has_many :birds, through: :sightings

  # add avatar to database
  def signed_up
   self.member_since = Time.current
  end

  def display_date
    self.member_since.strftime("%B %Y")
  end

  def slug 
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|username| username.slug == slug}
  end
end