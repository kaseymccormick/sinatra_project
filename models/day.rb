class Day < ActiveRecord::Base
    has_and_belongs_to_many :slots # (options = {})
end
# ----------method example
#  def top_photo?
#   if self.albums.length >= 3
#     true
#   else
#     false
#   end
# end
