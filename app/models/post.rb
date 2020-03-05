class Post < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many_attached :photos


  def snowpack
    # location.station.data where data.date = post.date
    location.central_station.data.find_by(date: self.date).snow_depth
  end

end
