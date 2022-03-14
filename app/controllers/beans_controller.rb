class BeansController < ApplicationController
  before_action(:force_user_sign_in)
  
  def index
    matching_beans = Bean.all

    @list_of_beans = matching_beans.order({ :roast_date => :asc })

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
    the_bean.roaster_id = Roaster.where({:name => params.fetch("query_roaster_name")}).first.id
    the_bean.name = params.fetch("query_name")
    the_bean.country_of_origin = params.fetch("query_country_of_origin")
    the_bean.roast_date = params.fetch("query_roast_date")
    the_bean.process = params.fetch("query_process")
    the_bean.roast_level = params.fetch("query_roast_level")

    if the_bean.valid?
      the_bean.save
      redirect_to("/beans", { :notice => "Bean created successfully." })
    else
      redirect_to("/beans", { :alert => the_bean.errors.full_messages.to_sentence })
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
      redirect_to("/beans/#{the_bean.id}", { :alert => the_bean.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_bean = Bean.where({ :id => the_id }).at(0)

    the_bean.destroy

    redirect_to("/beans", { :notice => "Bean deleted successfully."} )
  end

  def analytics
    matching_beans = Bean.where({ :id => params.fetch("path_id") })
    @the_bean = matching_beans.at(0)

    
    @master_array = Array.new
    matching_brews = @the_bean.brews

    matching_brews.each do |a_brew|
      @master_hash = Hash.new
      storage_array = Array.new
      matching_instructions = a_brew.instructions
      matching_instructions.each do |a_ins|
        storage_array.push([a_ins.time, a_ins.weight])
      end
      @master_hash = {:brew => a_brew.created_at.strftime("%m/%d/%Y"), :data => storage_array}
      @master_array.push(@master_hash)
    end

    render({:template => "/beans/analytics.html.erb"})
  end

end
