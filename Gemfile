source 'https://rubygems.org'
ruby '2.3.3'


# Assets
source 'https://rails-assets.org' do
  gem 'rails-assets-wow'
  gem 'rails-assets-fontawesome'
end

gem 'rack-cors', :require => 'rack/cors'

gem 'rails'
gem 'sass-rails'

# JS Handling
gem 'webpacker', '~> 3.0'

gem 'devise'
gem 'devise-bootstrap-views'
gem "cancancan"

gem 'md_simple_editor'

gem 'google-webfonts-rails'

# JS assets
gem 'fittextjs_rails'

# Environment Variables
gem "figaro"

# API Calling
gem 'rest-client'

gem 'leaflet-rails'

gem 'redcarpet'

# Cache
gem 'dalli'

gem 'inline_svg'

# gem "browserify-rails"
# gem 'react-rails', '~> 1.0'

# Coinprism Colored Coins API
# gem 'coinprism'

gem 'asset_sync'
gem 'fog-aws'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'sdoc',    group: :doc
gem 'spring',  group: :development

gem 'haml-rails'
gem 'high_voltage'
gem 'pg'
gem 'simple_form'

group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'better_errors'
  gem 'html2haml'
  gem 'quiet_assets'
  gem 'rails_layout'
end
group :production do
  gem 'puma'
  gem 'rails_12factor'
  gem 'heroku-deflater'  # Gzip compression
end
