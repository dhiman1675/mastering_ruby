class ProductsController < ApplicationController
  def index
    products = Product.all

    # Find outdated products and refresh them asynchronously
    outdated_products = products.select(&:outdated?)
    outdated_products.each { |product| ProductUpdateJob.perform_later(product.id) }

    render json: products.as_json(methods: [:outdated?])
  end

  def create
    url = params[:url]
    existing_product = Product.find_by(url: url)

    if existing_product && existing_product.last_scraped_at > 1.week.ago
      render json: existing_product
    else
      scraped_data = ScraperService.new(url).scrape
      product = Product.create(scraped_data.merge(last_scraped_at: Time.current))
      render json: product, status: :created
    end
  end
end
