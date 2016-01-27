###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

helpers do
  def body_classes
    [*current_path.split('/'), current_page.data.body_class].uniq
  end
end

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

activate :blog do |blog|
  blog.custom_collections = {
    category: {
          link: '/categories/{category}/index.html',
      template: '/category.html'  } }

  blog.page_link = 'p{num}'
  blog.per_page  = 3
  blog.paginate  = true
  blog.permalink = '{title}/'
  blog.sources   = 'posts/{title}.html'
end

# non-.html URLs
activate :directory_indexes

# Methods defined in the helpers block are available in templates

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'


# Build-specific configuration
configure :build do
  ignore 'images/*.psd'
  ignore 'stylesheets/lib/*'
  ignore 'stylesheets/vendor/*'
  ignore 'javascripts/lib/*'
  ignore 'javascripts/vendor/*'

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable asset hash
  activate :asset_hash

  # Enable cache buster
  activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  require "middleman-smusher"
  activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"

  activate :livereload
end

activate :s3_sync do |s3|
  s3.aws_access_key_id     = ENV['AWS_ACCESS_KEY_ID']
  s3.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  s3.bucket                = ENV['AWS_S3_SITE_BUCKET']
  s3.delete                = false # leave stray files
end

activate :cloudfront do |cloudfront|
  cloudfront.access_key_id     = ENV['AWS_ACCESS_KEY_ID']
  cloudfront.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  cloudfront.distribution_id   = ENV['AWS_CLOUDFRONT_SITE_ID']
# cloudfront.filter            = /^.(jpg|png|css|js)
end

