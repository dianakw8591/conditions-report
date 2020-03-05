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

    def station_and_data_create
        station_array = ["1107:WA:SNTL", "909:WA:SNTL", "908:WA:SNTL", "672:WA:SNTL", "791:WA:SNTL", "679:WA:SNTL", "515:WA:SNTL", "1171:WA:SNTL", "502:WA:SNTL"]
        base_url = "http://api.powderlin.es/station/"
        station_array.each do |triplet|
            url = base_url + triplet + "?days=3650"
            hash = parse(url)
            station_hash = hash["station_information"]
            station = Station.create(parse_station_data(station_hash))
            data_array = hash["data"]
            data_array.each do |data_hash|
                parsed_data = parse_historic_data_by_date(data_hash)
                parsed_data[:station_id] = station.id
                Datum.create(parsed_data)
            end
        end
    end

    def parse_station_data(hash)
        hash_for_station = {
            location_id: 1,
            elevation: hash["elevation"],
            lat: hash["location"]["lat"],
            lng: hash["location"]["lng"],
            name: hash["name"],
            triplet: hash["triplet"]
            }
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
