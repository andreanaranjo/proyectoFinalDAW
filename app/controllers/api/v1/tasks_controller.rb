class Api::V1::TasksController < ApiController
  before_action :set_api_v1_task, only: [:show, :update, :destroy]

  # GET /api/v1/tasks
  # GET /api/v1/tasks.json
  def index
    @api_v1_tasks = Task.all
  end

  # GET /api/v1/tasks/1
  # GET /api/v1/tasks/1.json
  def show
  end

  # POST /api/v1/tasks
  # POST /api/v1/tasks.json
  def create
    @api_v1_task = Task.new(api_v1_task_params)

    if @api_v1_task.save
      render :show, status: :created, location: @api_v1_task
    else
      render json: @api_v1_task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/tasks/1
  # PATCH/PUT /api/v1/tasks/1.json
  def update
    if @api_v1_task.update(api_v1_task_params)
      render :show, status: :ok, location: @api_v1_task
    else
      render json: @api_v1_task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/tasks/1
  # DELETE /api/v1/tasks/1.json
  def destroy
    @api_v1_task.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_task
      @api_v1_task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_task_params
      params.fetch(:api_v1_task, {})
    end
end
