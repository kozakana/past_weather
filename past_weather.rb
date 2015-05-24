require 'nokogiri'
require 'open-uri'
require 'json'

URL_LIST = 
  [
    'http://weather.goo.ne.jp/appearance_ratio/p0020/01.html',
    'http://weather.goo.ne.jp/appearance_ratio/p0020/02.html',
    'http://weather.goo.ne.jp/appearance_ratio/p0020/03.html',
    'http://weather.goo.ne.jp/appearance_ratio/p0020/04.html',
    'http://weather.goo.ne.jp/appearance_ratio/p0020/05.html',
    'http://weather.goo.ne.jp/appearance_ratio/p0020/06.html',
    'http://weather.goo.ne.jp/appearance_ratio/p0020/07.html',
    'http://weather.goo.ne.jp/appearance_ratio/p0020/08.html',
    'http://weather.goo.ne.jp/appearance_ratio/p0020/09.html',
    'http://weather.goo.ne.jp/appearance_ratio/p0020/10.html',
    'http://weather.goo.ne.jp/appearance_ratio/p0020/11.html',
    'http://weather.goo.ne.jp/appearance_ratio/p0020/12.html'
  ]

def get_document url
  charset = nil
  html = open(url) do |f|
    charset = f.charset
    f.read
  end
  Nokogiri::HTML.parse(html, nil, charset)
end

def get_url_list original_url
  list = []
  12.times do |i|
    month = sprintf("%02d",i+1)
    list << (original_url + "#{month}.html")
  end
  list
end

def get_weather_data url
  get_document url
  
  info_data = {}
  info = { weather: nil, high: nil, low: nil, average: nil }
  prev_date = nil
  doc.xpath('//tr/td').each do |node|
    date = node.xpath('a').text.to_s
    if date != ""
      date.gsub!(/月/, "/")
      date.gsub!(/日/, "")
      if prev_date
        info_data[prev_date] = info.dup
      end
      prev_date = date
    end
    
    climate = node.xpath('img')
    if climate.length == 1
      weather = climate[0].attribute('alt').value
      info[:weather] = case weather
      when "晴れ"
        :fine
      when "くもり"
        :cloudy
      when "雨"
        :rain
      when "雪"
        :snow
      else
        :other
      end
    end
  
    high = node.xpath('span[@class="red"]').text
    low  = node.xpath('span[@class="blue"]').text
    temperature = node.text
  
    if high != ""
      info[:high] = high[0...-1].to_i
    elsif low != ""
      info[:low] = low[0...-1].to_i
    else
      info[:average] = temperature[0...-1].to_i
    end
  end
  
  info_data[prev_date] = info
  
  info_data
end

all_data = {}
URL_LIST.each do |url|
  all_data.merge!(get_weather_data url)
end
open('waeather_data.json', 'w') do |io|
  JSON.dump(all_data, io)
end
p all_data
