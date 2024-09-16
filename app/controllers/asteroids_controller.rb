class AsteroidsController < ApplicationController
  before_action :set_asteroid, only: %i[ show update destroy ]

  # GET /asteroids
  def index
    filter

    render json: IndexResponseSerializer.new({
      items: ActiveModelSerializers::SerializableResource.new(@asteroids),
      total: @total,
      total_filtered: @total_filtered
    }).to_h
  end

  # GET /asteroids/1
  def show
    render json: @asteroid
  end

  # POST /asteroids
  def create
    @asteroid = Asteroid.new(asteroid_create_params)

    if @asteroid.save
      render json: @asteroid, status: :created, location: @asteroid
    else
      render json: @asteroid.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /asteroids/1
  def update
    if @asteroid.update(asteroid_params)
      render json: @asteroid
    else
      render json: @asteroid.errors, status: :unprocessable_entity
    end
  end

  # DELETE /asteroids/1
  def destroy
    @asteroid.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asteroid
      @asteroid = Asteroid.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def asteroid_params
      params.permit(:title, :description)
    end

    def asteroid_create_params
      asteroid_params
    end

    def pagination_per_page
      params[:per_page] || 10
    end

    def filter
      @asteroids = Asteroid
      @total = @asteroids.count
      filter_by_term
      @total_filtered = @asteroids.count
      @asteroids = Asteroid.offset(params[:offset]).limit(params[:limit])
    end

    def filter_by_term
      return unless params[:term].present?

      @asteroids = @asteroids.where("asteroids.title ilike ? or asteroids.description ilike ? ", "%#{params[:term]}%", "%#{params[:term]}%")
    end
end
