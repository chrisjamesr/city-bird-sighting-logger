class Sighting < ActiveRecord::Base
validates_presence_of :user_id, :bird_id, :location, :time_date, allow_blank: false
# after_initialize :display_time

belongs_to :bird
belongs_to :user


  # def display_time
  #   if !self.time_date.empty?
  #     time_date = Date.parse(self.time_date)
  #     self.time_date = time_date.strftime('%m-%d-%Y')
  #   end  
  # end

end

# self.time_date = time_date.strftime('%A %B %e, %Y | %l:%m%p')