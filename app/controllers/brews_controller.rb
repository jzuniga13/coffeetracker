class BrewsController < ApplicationController
  before_action(:force_user_sign_in)

  def index
    matching_brews = Brew.where(:user_id => @current_user.id)

    @list_of_brews = matching_brews.order({ :created_at => :desc })

    render({ :template => "brews/index.html.erb" })
  end

  def brew_wizard_landing
    render({:template => "brews/brew_wizard_landing.html.erb"})
  end

  def brew_wizard_instr
    render({:template => "brews/brew_wizard_instr.html.erb"})
  end

  def brew_wizard_close
    matching_brews = Brew.where({:id => params.fetch("path_id")})
    @the_brew = matching_brews.first
    render({:template => "brews/brew_wizard_close.html.erb"})
  end

  def show
    the_id = params.fetch("path_id")

    matching_brews = Brew.where({ :id => the_id })

    @the_brew = matching_brews.at(0)

    render({ :template => "brews/show.html.erb" })
  end

  def create
    the_brew = Brew.new
    if params.fetch("query_bean_name") == ""
      the_brew.bean_id = nil
    else
      the_brew.bean_id = Bean.where({:name => params.fetch("query_bean_name")}).first.id
    end
    the_brew.user_id = @current_user.id
    the_brew.device_id = Device.where({:device => params.fetch("query_device_name")}).first.id
    the_brew.grind_setting = params.fetch("query_grind_setting")
    the_brew.grinder = params.fetch("query_grinder")
    the_brew.coffee_weight = params.fetch("query_coffee_weight")
    the_brew.water_temp = params.fetch("query_water_temp")

    if the_brew.valid?
      the_brew.save
      redirect_to("/brew_instructions/#{the_brew.id}")
    else
      redirect_to("/brew_method/"+params.fetch("query_device_name"), { :alert => the_brew.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_brew = Brew.where({ :id => the_id }).at(0)

    the_brew.flavors = params.fetch("query_flavors")
    the_brew.comments = params.fetch("query_comments")
    
    if the_brew.valid?
      the_brew.save
      redirect_to("/brews/#{the_brew.id}", { :notice => "Brew updated successfully."} )
    else
      redirect_to("/brews/#{the_brew.id}", { :alert => the_brew.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_brew = Brew.where({ :id => the_id }).at(0)

    the_brew.destroy

    redirect_to("/brews", { :notice => "Brew deleted successfully."} )
  end
end
