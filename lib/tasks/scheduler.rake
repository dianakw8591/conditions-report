require_relative '../../db/api_calls'

desc "Updates snowpack data with current day info"
task :update_snowpack => :environment do
  GetData.new.update_snowpack('0')
end
