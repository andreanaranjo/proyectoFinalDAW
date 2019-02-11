class Api::V1::AnnouncementsController < ApiController
  before_action :set_api_v1_announcement, only: [:show, :update, :destroy]

  # GET /api/v1/announcements
  # GET /api/v1/announcements.json
  def index
    @api_v1_announcements = Announcement.all
  end

  # GET /api/v1/announcements/1
  # GET /api/v1/announcements/1.json
  def show
  end

  # POST /api/v1/announcements
  # POST /api/v1/announcements.json
  def create
    @api_v1_announcement = Announcement.new(api_v1_announcement_params)

    if @api_v1_announcement.save
      render :show, status: :created, location: @api_v1_announcement
    else
      render json: @api_v1_announcement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/announcements/1
  # PATCH/PUT /api/v1/announcements/1.json
  def update
    if @api_v1_announcement.update(api_v1_announcement_params)
      render :show, status: :ok, location: @api_v1_announcement
    else
      render json: @api_v1_announcement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/announcements/1
  # DELETE /api/v1/announcements/1.json
  def destroy
    @api_v1_announcement.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_announcement
      @api_v1_announcement = Announcement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_announcement_params
      params.fetch(:api_v1_announcement, {})
    end
end
