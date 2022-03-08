class RoastersController < ApplicationController
  def index
    matching_roasters = Roaster.all

    @list_of_roasters = matching_roasters.order({ :created_at => :desc })

    render({ :template => "roasters/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_roasters = Roaster.where({ :id => the_id })

    @the_roaster = matching_roasters.at(0)

    render({ :template => "roasters/show.html.erb" })
  end

  def create
    the_roaster = Roaster.new
    the_roaster.name = params.fetch("query_name")

    if the_roaster.valid?
      the_roaster.save
      redirect_to("/roasters", { :notice => "Roaster created successfully." })
    else
      redirect_to("/roasters", { :notice => "Roaster failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_roaster = Roaster.where({ :id => the_id }).at(0)

    the_roaster.name = params.fetch("query_name")

    if the_roaster.valid?
      the_roaster.save
      redirect_to("/roasters/#{the_roaster.id}", { :notice => "Roaster updated successfully."} )
    else
      redirect_to("/roasters/#{the_roaster.id}", { :alert => "Roaster failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_roaster = Roaster.where({ :id => the_id }).at(0)

    the_roaster.destroy

    redirect_to("/roasters", { :notice => "Roaster deleted successfully."} )
  end
end
