require 'spec_helper'

describe WeatherInsight do
  it 'has a version number' do
    expect(WeatherInsight::VERSION).not_to be nil
  end

  it 'can acquire data of January' do
    month_data = WeatherInsight.month_data :tokyo, 1
    expect(month_data.length).to eq 31
    month_data.each do |day|
      expect(day).not_to be nil
    end
  end
end
