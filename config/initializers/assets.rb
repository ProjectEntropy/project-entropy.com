# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
AssetSync.config.ignored_files = [
  'glyphicons-halflings-regulat.eot',
  'glyphicons-halflings-regulat.svg',
  'glyphicons-halflings-regulat.ttf',
  'glyphicons-halflings-regulat.woff',
  'glyphicons-halflings-regulat.woff2'
]
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
