require "test_helper"
require "webmock/minitest"

class ScraperServiceTest < ActiveSupport::TestCase
  def setup
    @test_url = "https://example.com/product"
    @html_response = <<-HTML
      <html>
        <body>
          <span class="mEh187">Product Title</span>
          <span class="VU-ZEz">Product Description</span>
          <div class="Nx9bqj">₹1,999</div>
          <div class="r2CdBx">
            <a class="R0cyWM">Category 1</a>
          </div>
          <div class="r2CdBx">
            <a class="R0cyWM">Category 2</a>
          </div>
        </body>
      </html>
    HTML

    # Mock the HTTP request to avoid hitting real URLs
    stub_request(:get, @test_url)
      .to_return(status: 200, body: @html_response, headers: { "Content-Type" => "text/html" })
  end

  test "scrapes product details correctly" do
    scraper = ScraperService.new(@test_url)
    result = scraper.scrape

    assert result.is_a?(Hash)
    assert_equal "Product Title", result[:title]
    assert_equal "Product Description", result[:description]
    assert_equal 1999.0, result[:price]
    assert_equal "Category 2", result[:category]  # Selecting the 2nd div.r2CdBx
    assert_equal @test_url, result[:url]
  end

  test "handles errors gracefully" do
    stub_request(:get, @test_url).to_raise(StandardError.new("Network error"))

    scraper = ScraperService.new(@test_url)
    result = scraper.scrape

    assert_nil result
  end
end
