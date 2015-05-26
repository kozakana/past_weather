module UrlList
  STANDARD_URL = 'http://weather.goo.ne.jp/appearance_ratio/'

  def month_url spot, month
    if 1<=month && month<=12
      month = sprintf("%02d",month)
      "#{STANDARD_URL}#{spot_url(spot)}#{month}.html"
    else
      raise ArgumentError, "invalid argument"
    end
  end
  
  def spot_url spot
    case spot
    when :dohoku
      'p0001/'
    when :doou
      'p0003/'
    when :dotou
      'p0004/'
    when :donan
      'p0007/'
    when :aomori
      'p0008/'
    when :akita
      'p0009/'
    when :iwate
      'p0010/'
    when :miyagi
      'p0011/'
    when :yamagata
      'p0012/'
    when :fukushima
      'p0013/'
    when :ibaraki
      'p0014/'
    when :tochigi
      'p0015/'
    when :gunma
      'p0016/'
    when :saitama
      'p0017/'
    when :tokyo
      'p0018/'
    when :chiba
      'p0019/'
    when :kanagawa
      'p0020/'
    when :nagano
      'p0021/'
    when :yamanashi
      'p0022/'
    when :shizuoka
      'p0023/'
    when :aichi
      'p0024/'
    when :gifu
      'p0025/'
    when :mie
      'p0026/'
    when :nigata
      'p0027/'
    when :toyama
      'p0028/'
    when :ishikawa
      'p0029/'
    when :fukui
      'p0030/'
    when :shiga
      'p0031/'
    when :kyoto
      'p0032/'
    when :osaka
      'p0033/'
    when :hyogo
      'p0034/'
    when :nara
      'p0035/'
    when :wakayama
      'p0036/'
    when :okayama
      'p0037/'
    when :hiroshima
      'p0038/'
    when :shimane
      'p0039/'
    when :tottori
      'p0040/'
    when :yamaguchi
      'p0041/'
    when :tokushima
      'p0042/'
    when :kagawa
      'p0043/'
    when :ehime
      'p0044/'
    when :kochi
      'p0045/'
    when :fukuoka
      'p0046/'
    when :oita
      'p0047/'
    when :nagasaki
      'p0048/'
    when :saga
      'p0049/'
    when :kumamoto
      'p0050/'
    when :miyazaki
      'p0051/'
    when :kagoshima
      'p0052/'
    when :okinawa
      'p0053/'
    when :miyako_ishigaki
      'p0054/'
    when :minamidaitojima
      'p0056/'
    else
      raise ArgumentError, "invalid argument"
    end
  end
end
