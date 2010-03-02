class UsersController < ApplicationController
  layout 'frankivska'  
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
  # Protect these actions behind an admin login
  # before_filter :admin_required, :only => [:suspend, :unsuspend, :destroy, :purge]
  before_filter :find_user, :only => [:suspend, :unsuspend, :destroy, :purge, :edit, :update, :show]

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success
      @user.register!
      @user.activate!
      self.current_user = @user
      new_cookie_flag = (params[:remember_me] == "1")
      handle_remember_cookie! new_cookie_flag
      flash[:notice] = I18n.t("flash_user_register_successfull", :sitename => SITE_NAME)
      redirect_to root_path
    else
      flash[:error]  = I18n.t("flash_user_register_unsuccessfull")
      render :action => 'new'
    end
  end

  def forgot
    if request.post?
      user = User.find_by_email(params[:user][:email])
      if user
        user.create_reset_code!
        flash[:notice] = I18n.t("flash_user_forgot_successfull")
      else
        flash[:notice] = I18n.t("flash_user_forgot_unsuccessfull", :email => params[:user][:email])
      end
      redirect_back_or_default('/')
    end
  end
    
  def reset
    @user = User.find_by_reset_code(params[:reset_code]) unless params[:reset_code].nil?
    if request.post?
      if @user.update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
        self.current_user = @user
        @user.delete_reset_code!
        flash[:notice] = I18n.t("flash_user_reset_successfull", :email => @user.email)
        redirect_back_or_default('/')
      else
        render :action => :reset
      end
    end
  end
  
  def suspend
    @user.suspend! 
    redirect_to users_path
  end

  def unsuspend
    @user.unsuspend! 
    redirect_to users_path
  end

  def destroy
    @user.delete!
    redirect_to users_path
  end

  def purge
    @user.destroy
    redirect_to users_path
  end
  
  protected
    def find_user
      @user = User.find(params[:id])
    end
end
