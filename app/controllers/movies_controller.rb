# class MoviesController < ApplicationController
#  before_action :set_movie, only: %i[ show edit update destroy ]
#
#  # GET /movies or /movies.json
#  def index
#    @movies = Movie.all
#    @column_names = Movie.column_names - [ "id", "description", "created_at", "updated_at" ]
#  end
#
#  # GET /movies/1 or /movies/1.json
#  def show
#  end
#
#  # GET /movies/new
#  def new
#    @movie = Movie.new
#  end
#
#  # GET /movies/1/edit
#  def edit
#  end
#
#  # POST /movies or /movies.json
#  def create
#    @movie = Movie.new(movie_params)
#
#    respond_to do |format|
#      if @movie.save
#        format.html { redirect_to @movie, notice: "Movie was successfully created." }
#        format.json { render :show, status: :created, location: @movie }
#      else
#        format.html { render :new, status: :unprocessable_entity }
#        format.json { render json: @movie.errors, status: :unprocessable_entity }
#      end
#    end
#  end
#
#  # PATCH/PUT /movies/1 or /movies/1.json
#  def update
#    respond_to do |format|
#      if @movie.update(movie_params)
#        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
#        format.json { render :show, status: :ok, location: @movie }
#      else
#        format.html { render :edit, status: :unprocessable_entity }
#        format.json { render json: @movie.errors, status: :unprocessable_entity }
#      end
#    end
#  end
#
#  # DELETE /movies/1 or /movies/1.json
#  def destroy
#    @movie.destroy!
#
#    respond_to do |format|
#      format.html { redirect_to movies_path, status: :see_other, notice: "Movie was successfully destroyed." }
#      format.json { head :no_content }
#    end
#  end
#
#  private
#    # Use callbacks to share common setup or constraints between actions.
#    def set_movie
#      @movie = Movie.find(params.expect(:id))
#    end
#
#    # Only allow a list of trusted parameters through.
#    def movie_params
#      params.expect(movie: [ :title, :rating, :description, :release_date ])
#    end
# end
#
#
class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]

  # The method helper_method is to explicitly share some methods defined in the controller to make them available for the view.
  helper_method :sort_column, :sort_direction

  # GET /movies or /movies.json
  def index
    session[:sort] = params[:sort] if params[:sort]
    session[:direction] = params[:direction] if params[:direction]

    @movies = Movie.order("#{sort_column} #{sort_direction}")
    @column_names = [ "title", "rating", "release_date" ]
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy!

    respond_to do |format|
      format.html { redirect_to movies_path, status: :see_other, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :release_date)
    end

    # Methods to handle sorting
    def sort_column
      %w[title rating release_date].include?(session[:sort]) ? session[:sort] : "title"
    end

    def sort_direction
      %w[asc desc].include?(session[:direction]) ? session[:direction] : "asc"
    end
end
