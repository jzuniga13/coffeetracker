class BrewsController < ApplicationController
  def index
    matching_brews = Brew.all

    @list_of_brews = matching_brews.order({ :created_at => :desc })

    render({ :template => "brews/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_brews = Brew.where({ :id => the_id })

    @the_brew = matching_brews.at(0)

    render({ :template => "brews/show.html.erb" })
  end

  def create
    the_brew = Brew.new
    the_brew.bean_id = params.fetch("query_bean_id")
    the_brew.user_id = params.fetch("query_user_id")
    the_brew.device_id = params.fetch("query_device_id")
    the_brew.grind_setting = params.fetch("query_grind_setting")
    the_brew.flavors = params.fetch("query_flavors")
    the_brew.grinder = params.fetch("query_grinder")
    the_brew.water_temp = params.fetch("query_water_temp")
    the_brew.comments = params.fetch("query_comments")
    the_brew.instructions_id = params.fetch("query_instructions_id")

    if the_brew.valid?
      the_brew.save
      redirect_to("/brews", { :notice => "Brew created successfully." })
    else
      redirect_to("/brews", { :notice => "Brew failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_brew = Brew.where({ :id => the_id }).at(0)

    the_brew.bean_id = params.fetch("query_bean_id")
    the_brew.user_id = params.fetch("query_user_id")
    the_brew.device_id = params.fetch("query_device_id")
    the_brew.grind_setting = params.fetch("query_grind_setting")
    the_brew.flavors = params.fetch("query_flavors")
    the_brew.grinder = params.fetch("query_grinder")
    the_brew.water_temp = params.fetch("query_water_temp")
    the_brew.comments = params.fetch("query_comments")
    the_brew.instructions_id = params.fetch("query_instructions_id")

    if the_brew.valid?
      the_brew.save
      redirect_to("/brews/#{the_brew.id}", { :notice => "Brew updated successfully."} )
    else
      redirect_to("/brews/#{the_brew.id}", { :alert => "Brew failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_brew = Brew.where({ :id => the_id }).at(0)

    the_brew.destroy

    redirect_to("/brews", { :notice => "Brew deleted successfully."} )
  end
end
