
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
CSV.foreach(Rails.root.join("db/seeds_data/ltbooks.csv"), headers: true) do |row|
  begin
    MediaItem.find_or_create_by( ltid: row[0], title: row[1], author: row[3], pub: row[7], date: row[8], tags: row[26], collections: row[27], isbn: row[31], isbns: row[32], created_at: row[38] )
  rescue
    puts "Error #{$!}"
  end

end

