# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative 'api_calls.rb'

# Station.delete_all
# Station.reset_pk_sequence

# Location.delete_all
# Location.reset_pk_sequence



# Datum.delete_all
# Datum.reset_pk_sequence

# Location.create(name: "Washington")

seed = GetData.new
# seed.station_create
# seed.historic_data


