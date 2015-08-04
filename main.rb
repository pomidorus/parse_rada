require 'rubygems'
require 'scrapi'
require 'htmlentities'


deputy = Scraper.define do
  process "p.title > a", :name => :text
  process "dl > dd:nth-child(8)", :party => :text
  result :name, :party
end

deputies = Scraper.define do
  array :deputies
  process "#search_results > ul > li", :deputies => deputy
  #process "body > ul > li", :deputies => deputy
  result :deputies
end

#uri = URI.parse("http://w1.c1.rada.gov.ua/pls/site2/fetch_mps?skl_id=9")
uri = URI.parse("https://raw.githubusercontent.com/pomidorus/rada/master/rada1.html")
persons = deputies.scrape(uri)
puts persons.size

persons.each do |person|
  puts person.inspect
  puts HTMLEntities.new.decode(person.party)
end
# puts HTMLEntities.new.decode(text)


# //*[@id="search_results"]/ul/li[1]/p[2]/a
#body > ul > li:nth-child(1) > dl > dd:nth-child(9)
#search_results > ul > li:nth-child(1) > dl > dd:nth-child(9)
