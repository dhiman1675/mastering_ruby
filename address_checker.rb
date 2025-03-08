require 'net/http'
require 'uri'
require 'json'

def fetch_geocode_data(location)
  url = URI("https://nominatim.openstreetmap.org/search?q=#{URI.encode_www_form_component(location)}&format=json&addressdetails=1&limit=1")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true # Enable HTTPS

  request = Net::HTTP::Get.new(url)
  request['User-Agent'] = 'BugBusterApp/1.0 (contact@example.com)' # Replace with your email

  response = http.request(request)

  if response.code == '200'
    data = JSON.parse(response.body)
    data.any? ? data.first : nil
  else
    puts "Error: Received HTTP #{response.code}"
    nil
  end
rescue StandardError => e
  puts "Error fetching geocode data: #{e.message}"
  nil
end

puts fetch_geocode_data('mandi, Himachal Pradesh, India')
