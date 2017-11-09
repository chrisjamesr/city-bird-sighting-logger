require 'wikipedia'

class Bird < ActiveRecord::Base
  extend Wiki::ClassMethods
  include Wiki::InstanceMethods

  validates_presence_of :species, allow_blank: false
  validates_uniqueness_of :species
  after_initialize :set_wiki_info
  has_many :sightings
  has_many :users, through: :birds

end # End of Class

