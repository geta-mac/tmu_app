class Api::V1::CustomersController < ApplicationController
  before_action :set_user_by_token, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    users = User.all
    render json: { status: 'SUCCESS', message: 'Loaded users', data: users }
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      render json: { status: 'SUCCESS', message: 'Saved user', data: @user }
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: { status: 'SUCCESS', message: 'Saved user', data: @user }
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    User.find(params[:id]).destroy
    render json: { status: 'SUCCESS', message: 'Removed user' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_by_token
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(
        :name, :nickname, :email, :password, :password_confirmation, :url, :club_id
      )
    end
end
