class Bird < ActiveRecord::base
has_many :sightings
has_many :users, through: :birds



end