class SitemapController < ApplicationController
  layout 'frankivska'  
  before_filter :collect_statistics!, :only => [:seo_site_map]
  after_filter :set_current_page!, :only => [:seo_site_map]
  
  caches_page :sitemap, :seo_site_map
  
  def sitemap
    @centers = RegionalCenter.find(:all, :limit => 50000)
    headers["Content-Type"] = "text/xml"
    headers["Last-Modified"] = @centers[0].updated_at.httpdate    
  end
  
  def seo_site_map
  end

end
