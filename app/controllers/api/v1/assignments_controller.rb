class Api::V1::AssignmentsController < ApiController
  before_action :set_api_v1_assignment, only: [:show, :update, :destroy]

  # GET /api/v1/assignments
  # GET /api/v1/assignments.json
  def index
    @api_v1_assignments = Assignment.all
  end

  # GET /api/v1/assignments/1
  # GET /api/v1/assignments/1.json
  def show
  end

  # POST /api/v1/assignments
  # POST /api/v1/assignments.json
  def create
    @api_v1_assignment = Assignment.new(api_v1_assignment_params)

    if @api_v1_assignment.save
      render :show, status: :created, location: @api_v1_assignment
    else
      render json: @api_v1_assignment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/assignments/1
  # PATCH/PUT /api/v1/assignments/1.json
  def update
    if @api_v1_assignment.update(api_v1_assignment_params)
      render :show, status: :ok, location: @api_v1_assignment
    else
      render json: @api_v1_assignment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/assignments/1
  # DELETE /api/v1/assignments/1.json
  def destroy
    @api_v1_assignment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_assignment
      @api_v1_assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_assignment_params
      params.fetch(:api_v1_assignment, {})
    end
end
