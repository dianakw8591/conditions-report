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

Location.create(name: "Olymipcs")
Location.create(name: "West Slopes North - Canadian Border to Skagit River")
Location.create(name: "West Slopes Central - Skagit River to South of I-90")
Location.create(name: "Snoqualmie Pass")
Location.create(name: "Stevens Pass")
Location.create(name: "West Slopes South - South of I-90 to Columbia River")
Location.create(name: "East Slopes North - Canadian Border to Lake Chelan")
Location.create(name: "East Slopes Central - Lake Chelan to South of I-90")
Location.create(name: "East Slopes South - South of I-90 to Columbia River")



seed = GetData.new
seed.station_and_data_create

station_array =["1107:WA:SNTL", "909:WA:SNTL", "908:WA:SNTL", "672:WA:SNTL", "791:WA:SNTL", "679:WA:SNTL", "515:WA:SNTL", "1171:WA:SNTL", "502:WA:SNTL"]

station = Station.find_by(triplet: "1107:WA:SNTL")
loc = Location.find_by(name: "Olymipcs")
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


