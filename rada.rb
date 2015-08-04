require 'rubygems'
require 'scrapi'
require 'htmlentities'

scraper = Scraper.define do
  process "title", :page_name => :text
  result :page_name
end

uri = URI.parse("http://www.rada.gov.ua/")
text = scraper.scrape(uri)
puts HTMLEntities.new.decode(text)
