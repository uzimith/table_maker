###
# Compass
###

# Change Compass configuration
compass_config do |config|
  config.output_style = :nest
  config.line_comments = false
end
require 'compass-normalize'
require 'breakpoint'

###
# Sprockets
###

sprockets.append_path 'components'

###
# Page options, layouts, aliases and proxies
###

with_layout :layout do
  page "/*", :layout => "layout"
end

with_layout :layout do
  page "/elements/*", :layout => false
end

###
# Helpers
###

helpers do
  def lang(path)
    I18n.locale.to_s + "/" + path
  end
end


activate :automatic_image_sizes
configure :development do
  activate :livereload
end

set :css_dir, 'style'
set :js_dir, 'js'
set :images_dir, 'images'
set :slim, { pretty: true, sort_attrs: false, format: :html }
Tilt::CoffeeScriptTemplate.default_bare = true

#deploy
activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'gh-pages'
end

configure :build do
  # activate :minify_css
  # activate :minify_javascript
  # activate :asset_hash
  # activate :relative_assets
  # set :http_prefix, "/Content/images/"
end
