require 'wikipedia'

class Bird < ActiveRecord::Base
  extend Wiki::ClassMethods
  include Wiki::InstanceMethods

  validates_presence_of :species, allow_blank: false
  validates :species, uniqueness: { case_sensitive: false }
  after_create :get_wiki_info 
  has_many :sightings
  has_many :users, through: :birds

end # End of Class

