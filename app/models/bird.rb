require 'wikipedia'

class Bird < ActiveRecord::Base
validates_presence_of :species, allow_blank: false
validates_uniqueness_of :species
after_initialize :set_wiki_info
has_many :sightings
has_many :users, through: :birds

  def set_wiki_info
    self.update(summary: summary, image_url: main_image_url)
  end  

  def wiki_scrape
    Wikipedia.find( self.species ) 
  end
    
  def main_image_url
    wiki_scrape.main_image_url
  end

  def summary
    wiki_scrape.summary
  end


 # def slug 
 #    username.downcase.gsub(" ","-")
 #  end

 #  def self.find_by_slug(slug)
 #      User.all.find{|username| username.slug == slug}
 #  end



end # End of Class

