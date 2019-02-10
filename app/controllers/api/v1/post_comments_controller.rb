class Api::V1::PostCommentsController < ApiController
  before_action :set_api_v1_post_comment, only: [:show, :update, :destroy]

  # GET /api/v1/post_comments
  # GET /api/v1/post_comments.json
  def index
    @api_v1_post_comments = PostComment.all
  end

  # GET /api/v1/post_comments/1
  # GET /api/v1/post_comments/1.json
  def show
  end

  # POST /api/v1/post_comments
  # POST /api/v1/post_comments.json
  def create
    @api_v1_post_comment = PostComment.new(api_v1_post_comment_params)

    if @api_v1_post_comment.save
      render :show, status: :created, location: @api_v1_post_comment
    else
      render json: @api_v1_post_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/post_comments/1
  # PATCH/PUT /api/v1/post_comments/1.json
  def update
    if @api_v1_post_comment.update(api_v1_post_comment_params)
      render :show, status: :ok, location: @api_v1_post_comment
    else
      render json: @api_v1_post_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/post_comments/1
  # DELETE /api/v1/post_comments/1.json
  def destroy
    @api_v1_post_comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_post_comment
      @api_v1_post_comment = PostComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_post_comment_params
      params.fetch(:api_v1_post_comment, {})
    end
end
