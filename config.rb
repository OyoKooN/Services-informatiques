# CodeRay syntax highlighting in Haml
# activate :code_ray

# Automatic sitemaps (gem install middleman-slickmap)
require "middleman-slickmap"
activate :slickmap

# Automatic image dimension calculations
# activate :automatic_image_sizes

# Per-page layout changes
# With no layout
# page "/path/to/file.html", :layout => false
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout

with_layout :admin_layout do
  page "/admin/*"
end

# Helpers
helpers do
  def sub_col_empty?(sub_col)
    if sub_col == "none\n"
      true
    else
      false
    end
  end
  def gallery(image, tuts = false)
    if tuts
      content_tag(:p, link_to(image_tag(image, :alt => "#"), "../images/" + image, :rel => :fancybox), :class => :gallery)
    else
      content_tag(:p, link_to(image_tag(image, :alt => "#"), "images/" + image, :rel => :fancybox), :class => :gallery)
    end
  end
end

# Change the CSS directory
# set :css_dir, "alternative_css_directory"

# Change the JS directory
# set :js_dir, "alternative_js_directory"

# Change the images directory
# set :images_dir, "alternative_image_directory"

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  
  # Minify Javascript on build
  activate :minify_javascript
  
  # Enable cache buster
  activate :cache_buster
  
  # Use relative URLs
  activate :relative_assets
  
  # Compress PNGs after build (gem install middleman-smusher)
  require "middleman-smusher"
  activate :smusher

  # Generate ugly/obfuscated HTML from Haml
  # activate :ugly_haml
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end
