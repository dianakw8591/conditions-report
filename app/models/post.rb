class Post < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many_attached :photos


  def snowpack
    query = location.central_station.data.find_by(date: self.date)
    if query.nil?
      "N/A"
    else
    query.snow_depth
    end
  end

end
