class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  # GET /flats
  # GET /flats.json
  def index
    @flats = Flat.geocoded
    @markers = @flats.map do|flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat })

      }
    end
  end

  # GET /flats/1
  # GET /flats/1.json
  def show
  end

  # GET /flats/new
  def new
    @flat = Flat.new
  end

  # GET /flats/1/edit
  def edit
  end

  # POST /flats
  # POST /flats.json
  def create
    @flat = Flat.new(flat_params)
      if @flat.save
        redirect_to @flat, notice: 'Flat was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /flats/1
  # PATCH/PUT /flats/1.json
  def update
      if @flat.update(flat_params)
        redirect_to @flat, notice: 'Flat was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /flats/1
  # DELETE /flats/1.json
  def destroy
    @flat.destroy
     redirect_to flats_url, notice: 'Flat was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flat
      @flat = Flat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flat_params
      params.require(:flat).permit(:name, :address, :latitude, :longitude)
    end
end
