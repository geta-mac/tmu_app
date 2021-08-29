class Api::V1::PostsController < ApplicationController
    before_action :set_post, only: %i[ show edit update destroy ]

    # GET /posts or /posts.json
    def index
      posts = Post.where(user_id: current_user.id)
      render json: posts, methods: [:image_url]
    end

    # GET /posts/1 or /posts/1.json
    def show
    end

    # GET /posts/new
    def new
      @post = Post.new
    end

    # GET /posts/1/edit
    def edit
    end

    # POST /posts or /posts.json
    def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      if @post.save!
        render json: @post, methods: [:image_url]
      else
        render json: @post.errors, status: 422
      end
    end

    # PATCH/PUT /posts/1 or /posts/1.json
    def update
      @post = Post.find(params[:id])      
      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors, status: 422
      end
    end

    # DELETE /posts/1 or /posts/1.json
    def destroy
      Post.find(params[:id]).destroy
      render json: { status: 'SUCCESS', message: 'Removed post' }
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def post_params
        params.permit(:title, :content, :image)
      end
  end
