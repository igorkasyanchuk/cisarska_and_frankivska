# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include SimpleCaptcha::ControllerHelpers
  #self.allow_forgery_protection = false
  # AuthenticatedSystem must be included for RoleRequirement, and is provided by installing acts_as_authenticates and running 'script/generate authenticated account user'.
  #include AuthenticatedSystem
  # You can move this into a different controller, if you wish.  This module gives you the require_role helpers, and others.
  #include RoleRequirementSystem
  include SimpleCaptcha::ControllerHelpers
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation, :credit_card, :number
  #rescue_from ActionController::RoutingError, :with => :render_404
  helper_method :log_server_activity!
  helper_method :set_locale
  helper_method :available_locales
  before_filter :set_locale
  before_filter :check_18_years
  before_filter :change_content_type
  before_filter :collect_statistics!
  
  private
    def available_locales
      AVAILABLE_LOCALES
    end
    
    def set_locale
      locale = params[:locale] || cookies[:locale]
      I18n.locale = locale.to_s
      cookies[:locale] = locale unless (cookies[:locale] && cookies[:locale] == locale)
    end
    
    def default_url_options(options={})
      { :locale => I18n.locale } 
    end
    
    def self.add_pagination!(pages = 10)
      class_eval %(
        protected
          def collection
            get_collection_ivar || set_collection_ivar(end_of_association_chain.paginate(:page => params[:page], :per_page => #{pages}))
          end)
    end
    
    def self.use_basic_tiny_editor!(only=nil)
      uses_tiny_mce(
        :options => 
        {
          :theme => 'advanced',
          :theme_advanced_toolbar_location => "top",
          :theme_advanced_toolbar_align => "left",
          :theme_advanced_resizing => true,
          :theme_advanced_resize_horizontal => false,
          :paste_auto_cleanup_on_paste => true,
          :theme_advanced_buttons1 => %w{bold italic underline strikethrough separator justifyleft justifycenter justifyright indent outdent separator bullist numlist separator undo redo},
          :theme_advanced_buttons2 => [],
          :theme_advanced_buttons3 => [],
          :plugins => %w{contextmenu paste},
          :content_css => '/stylesheets/tinymce.css?1'
        }, :only => only)      
    end
    
    def self.use_advanced_tiny_editor!(only=nil)
      uses_tiny_mce(
        :options => 
        {
          :theme => 'advanced',
          :theme_advanced_toolbar_location => "top",
          :theme_advanced_toolbar_align => "left",
          :theme_advanced_resizing => true,
          :theme_advanced_resize_horizontal => false,
          :paste_auto_cleanup_on_paste => true,
          :theme_advanced_buttons1 => %w{ formatselect bold italic underline strikethrough separator justifyleft justifycenter justifyright indent outdent separator bullist numlist forecolor backcolor separator link unlink undo redo},
          :theme_advanced_buttons2 => [],
          :theme_advanced_buttons3 => [],
          :plugins => %w{contextmenu paste table},
          :content_css => '/stylesheets/tinymce.css?2'
        }, :only => only)      
    end  
    
    def collect_statistics!
      @collect_statistics = true
    end
    
    def log_server_activity!
      user_id = logged_in? ? current_user.id : 0
      Activity.create(:by_user => user_id, 
      :remote_ip => request.remote_ip, 
      :controller_name => controller_name, 
      :controller_path => controller_path, 
      :action_name => action_name, 
      :params => '')
    end
    
    def render_optional_error_file(status_code)
      if status_code == :not_found
        render_404
      else
        super
      end
    end
    
    def render_404
      respond_to do |type| 
        type.html { render :controller => 'error', :action => 'a404', :template => "error/a404", :layout => 'errors', :status => 404 } 
        type.all  { render :nothing => true, :status => 404 } 
      end
      true
    end
    
    def set_current_page!
      session[:current_page] = request.request_uri
    end
    
    def check_18_years
      return if StatisticsHelper.bot?(request)
      return if action_name == 'balzam'
      return if ["sorry", 'splash', 'i_am_18_years_old', 'i_am_not_18_years_old'].include?(action_name)
      age_valid = (session["18_years_old"] || "") == "YES"
      unless age_valid
        redirect_to splash_path
      end
    end
    
    def self.layout_by_actions(h)
      layout :determine_layout
      code = lambda {
        res = "cisarska"
        h.each do |k,v|
         (res = k; break) if v.include?self.action_name
        end
        res
      }
      define_method(:determine_layout, code)
    end
    
      def change_content_type
        response.headers['Content-type'] = 'text/html; charset=utf-8'
      end

end
