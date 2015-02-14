require 'csv'

CSV.foreach(Rails.root.join('db/seeds_data/location_seed.csv')) do |row|
  begin
    Location.find_or_create_by(name: row[0], color: row[1], shelf: row[2])
  rescue
    puts "Error #{$!}"
  end
end
