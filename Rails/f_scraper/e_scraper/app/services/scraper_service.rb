# app/services/scraper_service.rb
require 'nokogiri'
require 'open-uri'

class ScraperService
  def initialize(url)
    @url = url
  end

  def scrape
    doc = Nokogiri::HTML(URI.open(@url))

    {
      title: doc.css('span.mEh187')&.text&.strip,
      description: doc.css('span.VU-ZEz')&.text&.strip,
      price: doc.css('div.Nx9bqj')&.text&.gsub(/[^\d.]/, '').to_f,
      category: doc.css('div.r2CdBx')[1]&.css('a.R0cyWM')&.first&.text&.strip,
      url: @url
    }
  rescue StandardError => e
    Rails.logger.error "Scraping failed: #{e.message}"
    nil
  end
end
