# WeatherInsight

WeatherInsight acquire average data of past weather from goo.

## Notice

WeatherInsight is used Web scraping. Therefore be careful about excessive access to a Web server.
You can adjust time interval which requests to web server.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'weather_insight'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install weather_insight

## Usage

```ruby
require 'weather_insight'

# How to get 7/28 data.
month_data = WeatherInsight.month_data :aichi, 7
month_data[28]
```

### Parameters

道北       :dohoku
道央       :doou
道東       :dotou
道南       :donan
青森       :aomori
秋田       :akita
岩手       :iwate
宮城       :miyagi
山形       :yamagata
福島       :fukushima
茨城       :ibaraki
栃木       :tochigi
群馬       :gunma
埼玉       :saitama
東京       :tokyo
千葉       :chiba
神奈川     :kanagawa
長野       :nagano
山梨       :yamanashi
静岡       :shizuoka
愛知       :aichi
岐阜       :gifu
三重       :mie
新潟       :nigata
富山       :toyama
石川       :ishikawa
福井       :fukui
滋賀       :shiga
京都       :kyoto
大阪       :osaka
兵庫       :hyogo
奈良       :nara
和歌山     :wakayama
岡山       :okayama
広島       :hiroshima
島根       :shimane
鳥取       :tottori
山口       :yamaguchi
徳島       :tokushima
香川       :kagawa
愛媛       :ehime
高知       :kochi
福岡       :fukuoka
大分       :oita
長崎       :nagasaki
佐賀       :saga
熊本       :kumamoto
宮崎       :miyazaki
鹿児島     :kagoshima
沖縄       :okinawa
宮古・石垣 :miyako_ishigaki
南大東島   :minamidaitojima

## Contributing

1. Fork it ( https://github.com/[my-github-username]/weather_insight/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
