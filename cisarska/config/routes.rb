ActionController::Routing::Routes.draw do |map|
  map.filter 'locale'
  map.site_map '/site_map', :controller => 'sitemap', :action => 'seo_site_map'
  map.resources :contacts, :only => [:new, :create, :destroy, :index], :controller => 'feedback'
  map.resources :feedbacks, :only => [:new, :create, :destroy, :index], :controller => 'feedback'
  map.root :controller => 'home', :action => 'index'
  map.splash '/splash', :controller => 'home', :action => 'splash'
  map.sorry '/sorry', :controller => 'home', :action => 'sorry'
  map.i_am_18_years_old '/i_am_18_years_old', :controller => 'home', :action => 'i_am_18_years_old'  
  map.i_am_not_18_years_old '/i_am_not_18_years_old', :controller => 'home', :action => 'i_am_not_18_years_old'  
  map.company '/company', :controller => 'home', :action => 'company'  
  map.products '/products', :controller => 'home', :action => 'products'  
  map.videos '/videos', :controller => 'home', :action => 'videos'
  map.quality '/quality', :controller => 'home', :action => 'quality'  
  map.contact '/contact', :controller => 'home', :action => 'contact'  
  map.contact_details '/contact_details', :controller => 'home', :action => 'contact_details'
  map.productions_ext '/productions_ext', :controller => 'home', :action => 'productions_ext'  
  map.dynamic '/dynamic', :controller => 'home', :action => 'dynamic'  
  map.history '/history', :controller => 'home', :action => 'history'  
  map.awards '/awards', :controller => 'home', :action => 'awards'
  map.balzam '/balzam', :controller => 'home', :action => 'balzam'
  map.simple_captcha '/simple_captcha/:action', :controller => 'simple_captcha'
  map.connect "sitemap.xml", :controller => "sitemap", :action => "sitemap", :format => 'xml'
  map.connect ':controller/:action/:id'
  map.connect '*path', :controller => 'home', :action => 'index' 
end
