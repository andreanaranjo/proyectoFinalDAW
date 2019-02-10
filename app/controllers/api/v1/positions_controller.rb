class Api::V1::PositionsController < ApiController
  before_action :set_api_v1_position, only: [:show, :update, :destroy]

  # GET /api/v1/positions
  # GET /api/v1/positions.json
  def index
    @api_v1_positions = Position.all
  end

  # GET /api/v1/positions/1
  # GET /api/v1/positions/1.json
  def show
  end

  # POST /api/v1/positions
  # POST /api/v1/positions.json
  def create
    @api_v1_position = Position.new(api_v1_position_params)

    if @api_v1_position.save
      render :show, status: :created, location: @api_v1_position
    else
      render json: @api_v1_position.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/positions/1
  # PATCH/PUT /api/v1/positions/1.json
  def update
    if @api_v1_position.update(api_v1_position_params)
      render :show, status: :ok, location: @api_v1_position
    else
      render json: @api_v1_position.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/positions/1
  # DELETE /api/v1/positions/1.json
  def destroy
    @api_v1_position.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_position
      @api_v1_position = Position.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_position_params
      params.fetch(:api_v1_position, {})
    end
end
