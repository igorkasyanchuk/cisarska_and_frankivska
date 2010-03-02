class FeedbackController < ApplicationController
  layout 'cisarska'
  before_filter :collect_statistics!
  after_filter :set_current_page!

  before_filter :authenticate, :only => [:index, :destroy]

  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if simple_captcha_valid? && @contact.save
      flash[:notice] = I18n.t("comment_is_added")
      redirect_to root_path
    else
      @contact.valid?
      @contact.errors.add_to_base(I18n.t('code_from_image_not_valid')) unless simple_captcha_valid?
      flash[:error]  = I18n.t("comment_not_added")
      redirect_to contact_path
    end
  end
  
  def index
    @feedbacks = Contact.all
  end
  
  def destroy
    @feedback = Contact.find params["id"]
    @feedback.destroy
    redirect_to contacts_path
  end
  
    protected
    
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "admin" && password == "admin12345!_"
      end
    end

end
