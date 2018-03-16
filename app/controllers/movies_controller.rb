class MoviesController < ApplicationController
    def index
       @movies = Movie.all
       #raise @movies.inspect
    end

    def show
        id = params[:id] # retrieve movie ID from URI route
        @movie = Movie.find(id) # look up movie by unique ID
        # will render app/views/movies/show.html.haml by default
    end

    # note, you will also have to update the 'new' method:
    def new
        @movie = Movie.new
        # default: render 'new' template
        # rails will default to an empty method if it's not there
        # so this one is optional 
    end

    # replaces the 'create' method in controller:
    def create
        #raise @params.inspect 
        @movie = Movie.new(movie_params)
        if @movie.save
            flash[:notice] = "#{@movie.title} was successfully created."
            redirect_to movies_path
        else
            render 'new' # note, 'new' template can access @movie's field values
        end
    end

    def edit
        @movie = Movie.find params[:id]
    end
  
    # replaces the 'update' method in controller:
    def update
        @movie = Movie.find params[:id]
        if @movie.update_attributes(params[:movie])
            flash[:notice] = "#{@movie.title} was successfully updated."
            redirect_to movie_path(@movie)
        else
            render 'edit' # note, 'edit' template can access @movie's field values!
        end
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        flash[:notice] = "Movie '#{@movie.title}' deleted."
        redirect_to movies_path
    end

    private
    def movie_params
        params.require(:movie).permit(:title, :rating, :description, :release_date, :timestamps)
    end
end
