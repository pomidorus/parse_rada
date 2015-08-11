require 'rubygems'
require 'scrapi'
require 'htmlentities'


deputy = Scraper.define do
  process "p.title > a", :name => :text
  process "dl > dd:nth-child(6)", :party => :text
  result :name, :party
end

deputies = Scraper.define do
  array :deputies
  process "#search_results > ul > li", :deputies => deputy
  result :deputies
end

uri = URI.parse("https://raw.githubusercontent.com/pomidorus/rada/master/rada1.html")
persons = deputies.scrape(uri)
puts persons.size

persons.each do |person|
  puts HTMLEntities.new.decode(person.name)
  puts HTMLEntities.new.decode(person.party)
end
