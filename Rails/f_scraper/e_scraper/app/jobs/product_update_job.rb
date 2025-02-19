class ProductUpdateJob < ApplicationJob
  queue_as :default

  def perform(product_id)
    product = Product.find_by(id: product_id)
    return unless product

    # Call the web scraper to get updated details
    updated_data = ScraperService.new(product.url).scrape

    # Update product details if scraping was successful
    if updated_data
      product.update(
        title: updated_data[:title],
        description: updated_data[:description],
        price: updated_data[:price],
        last_scraped_at: Time.current
      )
    end
  end
end
