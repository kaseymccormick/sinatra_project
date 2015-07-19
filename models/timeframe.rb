class TimeFrame < ActiveRecord::Base
  has_and_belongs_to_many :dates
  #what validation?
  #- uniqueness? 
end

# ----------method example
#  def top_photo?
#   if self.albums.length >= 3
#     true
#   else
#     false
#   end
# end