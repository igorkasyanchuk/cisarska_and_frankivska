class SitemapController < ApplicationController
  layout 'cisarska'  
  before_filter :collect_statistics!, :only => [:seo_site_map]
  after_filter :set_current_page!, :only => [:seo_site_map]
  
  caches_page :sitemap, :seo_site_map
  
  def sitemap
  end
  
  def seo_site_map
  end

end
