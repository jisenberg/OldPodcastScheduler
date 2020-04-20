# myapp.rb
require 'sinatra'
require 'rss'
require 'open-uri'
require 'nokogiri'

get '/' do
  erb :index
end

post '/parse-rss' do
  result = ""
  items = Nokogiri::XML.fragment "<item>Item1</item><item>Item3</item>"
  url = params[:url]
  feed = Nokogiri::XML(open(url))
  feed.xpath("//item").remove
  feed.xpath("//channel")[0].add_child(items)
  feed.to_xml
end
