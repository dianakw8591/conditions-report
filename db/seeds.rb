# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative 'api_calls.rb'

Datum.delete_all
Datum.reset_pk_sequence

Station.delete_all
Station.reset_pk_sequence

User.delete_all
User.reset_pk_sequence

Location.delete_all
Location.reset_pk_sequence

Location.create(name: "Olympics", img_url: "https://archive.usgs.gov/archive/sites/geomaps.wr.usgs.gov/parks/olym/mtoly.jpg")
Location.create(name: "West Slopes North - Canadian Border to Skagit River", img_url: "https://sda-seattle.org/wp-content/uploads/2015/11/SponsorLevel_Mt-Baker.jpg")
Location.create(name: "West Slopes Central - Skagit River to South of I-90", img_url: "https://miro.medium.com/max/9360/1*s-SvJ6Q2mjK55ne0CkTzYw.jpeg")
Location.create(name: "Stevens Pass", img_url: "https://media1.fdncms.com/stranger/imager/u/large/36876917/1544215933-gettyimages-531189558.jpg")
Location.create(name: "West Slopes South - South of I-90 to Columbia River", img_url: "https://s.abcnews.com/images/US/Mount-Rainier-gty-er-190606_hpMain_16x9_992.jpg")
Location.create(name: "Snoqualmie Pass", img_url: "https://komonews.com/resources/media/aea47f0d-bd84-4c77-b0a4-0f1143cad055-large16x9_rainier_snow.jpg?1480270090266")
Location.create(name: "East Slopes North - Canadian Border to Lake Chelan", img_url: "https://d2g8igdw686xgo.cloudfront.net/38036838_1553622755628743_r.jpeg")
Location.create(name: "East Slopes Central - Lake Chelan to South of I-90", img_url: "https://2ganwc3heo6y2kcytm13s0hf-wpengine.netdna-ssl.com/wp-content/uploads/2016/05/icicletv_stock_photography-311.jpg")
Location.create(name: "East Slopes South - South of I-90 to Columbia River", img_url: "https://www.whereiskylemiller.com/wp-content/uploads/2019/01/index.jpg")



seed = GetData.new
seed.station_and_data_create

station_array =["1107:WA:SNTL", "909:WA:SNTL", "908:WA:SNTL", "672:WA:SNTL", "791:WA:SNTL", "679:WA:SNTL", "515:WA:SNTL", "1171:WA:SNTL", "502:WA:SNTL"]

station = Station.find_by(triplet: "1107:WA:SNTL")
loc = Location.find_by(name: "Olympics")
loc.update(central_station_id: station.id)
station.update(location_id: loc.id)

station = Station.find_by(triplet: "909:WA:SNTL")
loc = Location.find_by(name: "West Slopes North - Canadian Border to Skagit River")
loc.update(central_station_id: station.id)
station.update(location_id: loc.id)

station = Station.find_by(triplet: "908:WA:SNTL")
loc = Location.find_by(name: "West Slopes Central - Skagit River to South of I-90")
loc.update(central_station_id: station.id)
station.update(location_id: loc.id)

station = Station.find_by(triplet: "672:WA:SNTL")
loc = Location.find_by(name: "Snoqualmie Pass")
loc.update(central_station_id: station.id)
station.update(location_id: loc.id)

station = Station.find_by(triplet: "791:WA:SNTL")
loc = Location.find_by(name: "Stevens Pass")
loc.update(central_station_id: station.id)
station.update(location_id: loc.id)

station = Station.find_by(triplet: "679:WA:SNTL")
loc = Location.find_by(name: "West Slopes South - South of I-90 to Columbia River")
loc.update(central_station_id: station.id)
station.update(location_id: loc.id)

station = Station.find_by(triplet: "515:WA:SNTL")
loc = Location.find_by(name: "East Slopes North - Canadian Border to Lake Chelan")
loc.update(central_station_id: station.id)
station.update(location_id: loc.id)

station = Station.find_by(triplet: "1171:WA:SNTL")
loc = Location.find_by(name: "East Slopes Central - Lake Chelan to South of I-90")
loc.update(central_station_id: station.id)
station.update(location_id: loc.id)

station = Station.find_by(triplet: "502:WA:SNTL")
loc = Location.find_by(name: "East Slopes South - South of I-90 to Columbia River")
loc.update(central_station_id: station.id)
station.update(location_id: loc.id)


