#===============================================================================
# config.rb
#===============================================================================

#-------------------------------------------------------------------------------
# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions
#-------------------------------------------------------------------------------
activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end
activate :livereload
activate :sprockets
#-------------------------------------------------------------------------------
# Layouts
# https://middlemanapp.com/basics/layouts/
#-------------------------------------------------------------------------------
# Per-page layout changes
page '/*.xml',  layout: false
page '/*.json', layout: false
page '/*.txt',  layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

#-------------------------------------------------------------------------------
# Paths
#-------------------------------------------------------------------------------
# activate :directory_indexes
activate :relative_assets
set      :relative_links, true
set      :css_dir,        "assets/stylesheets"
set      :js_dir,         "assets/javascripts"
set      :images_dir,     "assets/images"

#-------------------------------------------------------------------------------
# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/
#-------------------------------------------------------------------------------
# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )
#-------------------------------------------------------------------------------
# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/
#-------------------------------------------------------------------------------
require "lib/custom_helpers"
helpers CustomHelpers
# helpers do
#   def some_helper
#     'Helping'
#   end
# end

#-------------------------------------------------------------------------------
# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings
#-------------------------------------------------------------------------------
configure :build do
  activate :minify_css
  activate :minify_javascript
end

after_build do
  system('htmlbeautifier build/*.html')
  system('htmlbeautifier build/*/*.html')
end
#-------------------------------------------------------------------------------
# Other
#-------------------------------------------------------------------------------
Haml::TempleEngine.disable_option_validator!
