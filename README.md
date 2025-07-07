# RoB Web Scraper

A simple Ruby on Rails app for monitoring product stock status on retail websites like Best Buy. It uses a headless browser to evaluate product availability with real-time checks and a clean interface to manage your tracked products. Example code is setup to track the 'Nintendo Switch 2' on BestBuy

<img width="857" alt="Screenshot 2025-07-07 at 12 52 36 AM" src="https://github.com/user-attachments/assets/1775a828-154b-4235-aa99-8b19a4ae8573" />

## Features
- Track multiple product URLs with custom settings
- Choose between:
  - `Text Match` (check if certain text appears on the page)
  - `Element Exists` (check if a selector exists)
  - `Element Not Exists` (check if a selector is missing)
- Uses `Ferrum` (headless Chrome driver) for accurate, JavaScript-enabled scraping
- Clean UI for:
  - Adding new products
  - Viewing live check results
  - Editing tracking rules
  - Deleting products
- Built-in status checks show real-time results (✅ / ❌)
  
## Tech Stack
- Ruby 3.4.4
- Rails 8.0.2
- Ferrum
- SQLite or PostgreSQL
- Tailwind CSS


## Usage
- Click “Add New Product”
- Enter:
- A product name (e.g. “Nintendo Switch 2”)
- Product URL
- Check type (text, exists, not_exists)
- CSS selector
- Text to match (if check type is text)
- View your tracked products on the homepage
- Click a product to view results
- Click “Edit” to change selector or match settings
- Use the “Run Stock Check Now” button to recheck

## Future Improvements
- Add email/SMS/Discord alerts
- Schedule checks using background jobs (Sidekiq or ActiveJob + cron)
- Add user accounts for multi-user tracking
- Replace inline CSS with a full frontend framework
