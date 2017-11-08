require 'wikipedia'

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

  def full_page_info
      page = Wikipedia.find( self.species )
    end  

    def main_image_url
      full_page_info.main_image_url
    end

    def all_images
      full_page_info.images
    end   

    def summary
      full_page_info.summary
    end



end # End of Class

