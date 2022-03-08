class BeansController < ApplicationController
  def index
    matching_beans = Bean.all

    @list_of_beans = matching_beans.order({ :created_at => :desc })

    render({ :template => "beans/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_beans = Bean.where({ :id => the_id })

    @the_bean = matching_beans.at(0)

    render({ :template => "beans/show.html.erb" })
  end

  def create
    the_bean = Bean.new
    the_bean.roaster_id = params.fetch("query_roaster_id")
    the_bean.name = params.fetch("query_name")
    the_bean.country_of_origin = params.fetch("query_country_of_origin")
    the_bean.roast_date = params.fetch("query_roast_date")
    the_bean.process = params.fetch("query_process")
    the_bean.roast_level = params.fetch("query_roast_level")

    if the_bean.valid?
      the_bean.save
      redirect_to("/beans", { :notice => "Bean created successfully." })
    else
      redirect_to("/beans", { :notice => "Bean failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_bean = Bean.where({ :id => the_id }).at(0)

    the_bean.roaster_id = params.fetch("query_roaster_id")
    the_bean.name = params.fetch("query_name")
    the_bean.country_of_origin = params.fetch("query_country_of_origin")
    the_bean.roast_date = params.fetch("query_roast_date")
    the_bean.process = params.fetch("query_process")
    the_bean.roast_level = params.fetch("query_roast_level")

    if the_bean.valid?
      the_bean.save
      redirect_to("/beans/#{the_bean.id}", { :notice => "Bean updated successfully."} )
    else
      redirect_to("/beans/#{the_bean.id}", { :alert => "Bean failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_bean = Bean.where({ :id => the_id }).at(0)

    the_bean.destroy

    redirect_to("/beans", { :notice => "Bean deleted successfully."} )
  end
end
