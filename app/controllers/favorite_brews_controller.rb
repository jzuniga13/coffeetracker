class FavoriteBrewsController < ApplicationController
  def index
    matching_favorite_brews = FavoriteBrew.all

    @list_of_favorite_brews = matching_favorite_brews.order({ :created_at => :desc })

    render({ :template => "favorite_brews/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_favorite_brews = FavoriteBrew.where({ :id => the_id })

    @the_favorite_brew = matching_favorite_brews.at(0)

    render({ :template => "favorite_brews/show.html.erb" })
  end

  def create
    the_favorite_brew = FavoriteBrew.new
    the_favorite_brew.user_id = params.fetch("query_user_id")
    the_favorite_brew.brew_id = params.fetch("query_brew_id")

    if the_favorite_brew.valid?
      the_favorite_brew.save
      redirect_to("/favorite_brews", { :notice => "Favorite brew created successfully." })
    else
      redirect_to("/favorite_brews", { :notice => "Favorite brew failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_favorite_brew = FavoriteBrew.where({ :id => the_id }).at(0)

    the_favorite_brew.user_id = params.fetch("query_user_id")
    the_favorite_brew.brew_id = params.fetch("query_brew_id")

    if the_favorite_brew.valid?
      the_favorite_brew.save
      redirect_to("/favorite_brews/#{the_favorite_brew.id}", { :notice => "Favorite brew updated successfully."} )
    else
      redirect_to("/favorite_brews/#{the_favorite_brew.id}", { :alert => "Favorite brew failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_favorite_brew = FavoriteBrew.where({ :id => the_id }).at(0)

    the_favorite_brew.destroy

    redirect_to("/favorite_brews", { :notice => "Favorite brew deleted successfully."} )
  end
end
