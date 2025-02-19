class Product < ApplicationRecord
  def outdated?
    last_scraped_at.nil? || last_scraped_at < 7.days.ago
  end
end
