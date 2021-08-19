class Api::V1::PublicController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    posts = Post.all
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: posts }
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.fetch(:post, {}).permit(
        :title, :content, :user_id
      )
    end
end
