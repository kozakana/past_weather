# ---
# Copyright 2015 by kozakana.
# All rights reserved.
# See LICENSE.txt for permissions.
# ---

require 'nokogiri'
require 'open-uri'
require './url_list'

class WeatherInsight
  include UrlList

  def month_data spot, month
    url = month_url spot, month
    get_data url
  end

  def year_data spot
    year_data = {}

    1.upto(12) do |month|
      url = month_url spot, month
      month_data = get_data url
      year_data[month] = month_data
    end

    year_data     # year_data[:month][:day]
  end

  private

  def get_document url
    charset = nil
    html = open(url) do |f|
      charset = f.charset
      f.read
    end
    Nokogiri::HTML.parse(html, nil, charset)
  end
  
  def get_data url
    doc = get_document url
    
    info_data = {}
    info = { weather: nil, high: nil, low: nil, average: nil }
    prev_date = nil
    doc.xpath('//tr/td').each do |node|
      date = node.xpath('a').text.to_s
      if date != ""
        md = date.match(/\d+月(\d+)日/)
        date = md[1].to_i
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
        info[:high] = high[0...-1].to_f
      elsif low != ""
        info[:low] = low[0...-1].to_f
      else
        info[:average] = temperature[0...-1].to_f
      end
    end
    
    info_data[prev_date] = info
    info_data
  end
end

#wi = WeatherInsight.new
#wi.month_data :aichi, 3
#p wi.year_data :aichi
