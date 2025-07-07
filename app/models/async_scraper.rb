require 'ferrum'

class AsyncScraper
  attr_reader :page

  def initialize(url)
    browser = Ferrum::Browser.new(timeout: 15)
    browser.goto(url)
    @page = browser
  end

  def sold_out?
    # Returns true if the "Sold Out" button exists
    page.at_css('[data-test-id="sold-out"]').present?
  end
end
