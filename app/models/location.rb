class Location < ApplicationRecord
    has_many :users
    has_many :stations
    has_many :posts

    def central_station
        id = self.central_station_id
        Station.find(id)
    end

    def central_station_snowpack
        central_station.data.last.snow_depth
    end

    def central_station_date
        central_station.data.last.date
    end
end
