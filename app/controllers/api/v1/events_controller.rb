class Api::V1::EventsController < ApiController
  before_action :set_api_v1_event, only: [:show, :update, :destroy]

  # GET /api/v1/events
  # GET /api/v1/events.json
  def index
    @api_v1_events = Event.all
  end

  # GET /api/v1/events/1
  # GET /api/v1/events/1.json
  def show
  end

  # POST /api/v1/events
  # POST /api/v1/events.json
  def create
    @api_v1_event = Event.new(api_v1_event_params)

    if @api_v1_event.save
      render :show, status: :created, location: @api_v1_event
    else
      render json: @api_v1_event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/events/1
  # PATCH/PUT /api/v1/events/1.json
  def update
    if @api_v1_event.update(api_v1_event_params)
      render :show, status: :ok, location: @api_v1_event
    else
      render json: @api_v1_event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/events/1
  # DELETE /api/v1/events/1.json
  def destroy
    @api_v1_event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_event
      @api_v1_event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_event_params
      params.fetch(:api_v1_event, {})
    end
end
