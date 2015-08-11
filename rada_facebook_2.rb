require 'rubygems'
require 'scrapi'
require 'htmlentities'

#<abbr title="1 августа 2015 г. в 0:10" data-utime="1438413043" data-shorten="1" class="_5ptz">1 августа в 0:10</abbr>
#tl_unit_972894672612304803 > div > div > div._1dwg > div.clearfix._5x46 > div > div > div > div:nth-child(2) > div > span > span > a > abbr
post = Scraper.define do
  process "div.clearfix._5x46 > div > div > div > div:nth-child(2) > div > span > span > a > abbr", :data => "@title"
  process "div._5pbx.userContent > p", :body => :text
  result :body, :data
end

posts = Scraper.define do
  array :posts
  process "div._1dwg", :posts => post
  result :posts
end

uri = URI.parse("https://raw.githubusercontent.com/pomidorus/rada_2/master/%D0%86%D0%B3%D0%BE%D1%80%20%D0%90%D0%BB%D0%B5%D0%BA%D1%81%D1%94%D1%94%D0%B2.html")
deputy_posts = posts.scrape(uri)
puts deputy_posts.size

deputy_posts.each do |post|
  unless post.body.nil?
    puts HTMLEntities.new.decode(post.data).inspect
    puts HTMLEntities.new.decode(post.body).inspect
  end
end
