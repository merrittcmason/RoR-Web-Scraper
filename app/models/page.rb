# app/models/page.rb

class Page < ApplicationRecord
  has_many :results, dependent: :destroy

  validates :url, presence: true
  validates :check_type, presence: true
  validates :selector, presence: true
  validates :match_text, presence: { if: -> { check_type == "text" } }

  def run_check!
    require "ferrum"

    browser = Ferrum::Browser.new(timeout: 20)
    browser.goto(url)

    # 1) Click the Nintendo Switch 2 variant tab (if present)
    begin
      switch_tab = browser.at_xpath("//button[contains(., 'Nintendo Switch 2')]")
      switch_tab&.click
    rescue Ferrum::NodeNotFoundError
      # no-op
    end

    # 2) Wait for all network/JS to finish
    browser.network.wait_for_idle

    # 3) Check for an actual "Add to Cart" button
    #    (this button only appears when the exact SKU is in stock)
    in_stock = !!safe_find(browser, selector)

    # 4) Persist the result
    results.create(success: in_stock)
  ensure
    browser&.quit
  end

  private

  # Wrap at_css to avoid crashing when node is missing
  def safe_find(browser, css_selector)
    browser.at_css(css_selector)
  rescue Ferrum::NodeNotFoundError
    nil
  end
end
