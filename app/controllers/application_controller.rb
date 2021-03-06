class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  
  # Uncomment this if you want to force users to sign in before any other actions
  # before_action(:force_user_sign_in)
  
  def index
    if @current_user == nil
      redirect_to("/user_sign_in", { :alert => "Please sign in!" })
    else
      render({:template => "/shared/index.html.erb"})
    end
  end

  def about
    render({:template => "/shared/about.html.erb"})
  end

  def load_current_user
    the_id = session[:user_id]
    @current_user = User.where({ :id => the_id }).first
  end
  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :alert => "Please sign in!" })
    end
  end

end
