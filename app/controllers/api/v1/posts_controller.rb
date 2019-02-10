class Api::V1::PostsController < ApiController
  before_action :set_api_v1_post, only: [:show, :update, :destroy]

  # GET /api/v1/posts
  # GET /api/v1/posts.json
  def index
    @api_v1_posts = Post.all
  end

  # GET /api/v1/posts/1
  # GET /api/v1/posts/1.json
  def show
  end

  # POST /api/v1/posts
  # POST /api/v1/posts.json
  def create
    @api_v1_post = Post.new(api_v1_post_params)

    if @api_v1_post.save
      render :show, status: :created, location: @api_v1_post
    else
      render json: @api_v1_post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/posts/1
  # PATCH/PUT /api/v1/posts/1.json
  def update
    if @api_v1_post.update(api_v1_post_params)
      render :show, status: :ok, location: @api_v1_post
    else
      render json: @api_v1_post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/posts/1
  # DELETE /api/v1/posts/1.json
  def destroy
    @api_v1_post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_post
      @api_v1_post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_post_params
      params.fetch(:api_v1_post, {})
    end
end
