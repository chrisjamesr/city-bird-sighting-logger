class Sighting < ActiveRecord::Base
validates_presence_of :user_id, :bird_id, :location, :time_date, allow_blank: false
# Modify to validate bird_id or bird url to find unknown bird from photo
belongs_to :bird
belongs_to :user

end
