class Api::V1::MembersController < ApiController
  before_action :set_api_v1_member, only: [:show, :update, :destroy]

  # GET /api/v1/members
  # GET /api/v1/members.json
  def index
    @api_v1_members = Member.all
  end

  # GET /api/v1/members/1
  # GET /api/v1/members/1.json
  def show
  end

  # POST /api/v1/members
  # POST /api/v1/members.json
  def create
    @api_v1_member = Member.new(api_v1_member_params)

    if @api_v1_member.save
      render :show, status: :created, location: @api_v1_member
    else
      render json: @api_v1_member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/members/1
  # PATCH/PUT /api/v1/members/1.json
  def update
    if @api_v1_member.update(api_v1_member_params)
      render :show, status: :ok, location: @api_v1_member
    else
      render json: @api_v1_member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/members/1
  # DELETE /api/v1/members/1.json
  def destroy
    @api_v1_member.destroy
  end

  def get_member_id_from_user
    if request.headers['Authorization'].present?
      decoded_auth_token = JsonWebToken.decode request.headers['Authorization'].split(' ').last
      token = HashWithIndifferentAccess.new decoded_auth_token
      begin
        miembro = Member.where(user_id: token[:user_id]).first
        render json: {member_id: miembro.id}, status: :created
      rescue ActiveRecord::RecordNotFound
        render json: {error: "User not found"}, status: :bad_request
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_member
      @api_v1_member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_member_params
      params.fetch(:api_v1_member, {})
    end
end
