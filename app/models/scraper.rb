require "net/http"
require "nokogiri"
require "uri"

class Scraper
  attr_reader :document

  def initialize(url)
    response = Net::HTTP.get(URI(url))
    @document = Nokogiri::HTML(response)
  end

  def present?(selector:)
    document.at_css(selector)&.text&.strip&.downcase&.include?("add to cart")
  end
end
