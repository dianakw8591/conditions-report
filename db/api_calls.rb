require 'net/http'
require 'open-uri'
require 'json'

class GetData

  $STATION_ARRAY = ["1107:WA:SNTL", "909:WA:SNTL", "908:WA:SNTL", "672:WA:SNTL", "791:WA:SNTL", "679:WA:SNTL", "515:WA:SNTL", "1171:WA:SNTL", "502:WA:SNTL"]
  $BASE_URL = "http://api.powderlin.es/station/"
    
  def get_data(url)
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def parse(url)
    JSON.parse(self.get_data(url))
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

  def create_datum(array, id)
    array.each do |data_hash|
      parsed_data = parse_historic_data_by_date(data_hash)
      parsed_data[:station_id] = id
      Datum.create(parsed_data)
    end
  end

  def create_station(hash)
    Station.create(parse_station_data(hash))
  end


  def station_and_data_create
    $STATION_ARRAY.each do |triplet|
      url = $BASE_URL + triplet + "?days=3650"
      hash = parse(url)
      station = create_station(hash["station_information"])
      create_datum(hash["data"], station.id)
    end
  end

  def update_snowpack(days)
    $STATION_ARRAY.each do |triplet|
      url = $BASE_URL + triplet + "?days=" + days
      data_array = parse(url)["data"]
      station_id = Station.find_by(triplet: triplet).id
      create_datum(data_array, station_id)
    end
  end

end
