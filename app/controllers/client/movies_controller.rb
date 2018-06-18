class Client::MoviesController < ApplicationController

  def index
    @movies = Unirest.get("http://localhost:3000/api/movies").body
    render "index.html.erb"
  end

  def show
    @movie = Unirest.get("http://localhost:3000/api/movies/#{params[:id]}").body
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    movie_params = {
      title: params["title"],
      genre: params["genre"],
      year: params["year"],
      art_url: params["art_url"]
    }
    response = Unirest.post("http://localhost:3000/api/movies", parameters: movie_params).body
    flash[:message] = "Movie sucessfully added"
    redirect_to "/client/movies/#{response['id']}"
  end

  def edit
   @movie = Unirest.get("http://localhost:3000/api/movies/#{params[:id]}").body
    render "edit.html.erb"  
  end

  def update
      movie_params = {
      title: params["title"],
      genre: params["genre"],
      year: params["year"],
      art_url: params["art_url"]
    }
    response = Unirest.patch("http://localhost:3000/api/movies/#{params[:id]}", parameters: movie_params).body
    flash[:message] = "Movie sucessfully updated"
    redirect_to "/client/movies/#{response['id']}"
  end

  def destroy
    response = Unirest.delete("http://localhost:3000/api/movies/#{params[:id]}").body
    flash[:message] = "Movie sucessfully deleted"
    redirect_to "/client/movies"
  end

end
