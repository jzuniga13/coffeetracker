class DevicesController < ApplicationController
  def index
    matching_devices = Device.all

    @list_of_devices = matching_devices.order({ :created_at => :desc })

    render({ :template => "devices/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_devices = Device.where({ :id => the_id })

    @the_device = matching_devices.at(0)

    render({ :template => "devices/show.html.erb" })
  end

  def create
    the_device = Device.new
    the_device.device = params.fetch("query_device")

    if the_device.valid?
      the_device.save
      redirect_to("/devices", { :notice => "Device created successfully." })
    else
      redirect_to("/devices", { :notice => "Device failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_device = Device.where({ :id => the_id }).at(0)

    the_device.device = params.fetch("query_device")

    if the_device.valid?
      the_device.save
      redirect_to("/devices/#{the_device.id}", { :notice => "Device updated successfully."} )
    else
      redirect_to("/devices/#{the_device.id}", { :alert => "Device failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_device = Device.where({ :id => the_id }).at(0)

    the_device.destroy

    redirect_to("/devices", { :notice => "Device deleted successfully."} )
  end
end
