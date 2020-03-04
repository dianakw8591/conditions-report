require 'net/http'
require 'open-uri'
require 'json'


     
class GetData
    
    def get_data(url)
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse(url)
        JSON.parse(self.get_data(url))
    end


    def station_create
        stations_url = "http://api.powderlin.es/stations"
        stations = parse(stations_url)
        stations.collect do |station|
            id = station["triplet"].split(':')
            if id[1] == "WA"
                hash = 
                    {location_id: 1,
                    elevation: station["elevation"],
                    lat: station["location"]["lat"],
                    lng: station["location"]["lng"],
                    name: station["name"],
                    triplet: station["triplet"]
                    }
                Station.create(hash)
            end
        end
    end
    
    def historic_data
        Station.all.each do |station|
            triplet = station.triplet
            url = "http://api.powderlin.es/station/" + triplet + "?days=3650"
            data = parse(url)["data"]
            # array of hashes where each hash is a single date
            data.each do |hash|
                parsed_hash = parse_historic_data_by_date(hash)
                data_row = Datum.create(station_id: station.id)
                data_row.update(parsed_hash)
            end
        end
    end

    def parse_historic_data_by_date(hash)
        hash_for_data = {
            date: hash["Date"],
            swe: hash["Snow Water Equivalent (in)"].to_f,
            snow_depth: hash["Snow Depth (in)"].to_f,
            observed_temp: hash["Observed Air Temperature (degrees farenheit)"].to_f
        }
    end

end

# http://api.powderlin.es/station/791:WA:SNTL?startdate=2013-01-15&enddate=2013-01-15