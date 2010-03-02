class HomeController < ApplicationController

  layout_by_actions({
    "cisarska_ext" => ["sorry", 'splash', 'i_am_18_years_old', 'i_am_not_18_years_old']
  })
  
  before_filter :collect_statistics!  
  after_filter :set_current_page!
  
  def index
  end
  
  def i_am_18_years_old
    session["18_years_old"] = "YES"
    redirect_to root_path
  end
  
  def i_am_not_18_years_old
    session["18_years_old"] = "NO"
    redirect_to sorry_path
  end
  
  def contact
    @contact = Contact.new
  end
  
  def balzam
    session["18_years_old"] = "YES"
  end
  
  private
  
    def sort_order(default)
      "#{(params[:c] || default.to_s).gsub(/[\s;'\"]/,'')} #{params[:d] == 'down' ? 'DESC' : 'ASC'}"
    end

end

