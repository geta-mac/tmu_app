class Api::V1::CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]

  # GET /customers or /customers.json
  def index
    customers = User.all
    render json: { status: 'SUCCESS', message: 'Loaded customers', data: customers }
  end

  # GET /customers/1 or /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = User.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = User.new(user_params)
    if @customer.save
      render json: { status: 'SUCCESS', message: 'Saved customer', data: @customer }
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    @customer = User.find(params[:id])
    if @customer.update(user_params)
      render json: { status: 'SUCCESS', message: 'Saved customer', data: @customer }
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    User.find(params[:id]).destroy
    render json: { status: 'SUCCESS', message: 'Removed customer' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_by_token
      @customer = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {}).permit(
        :name, :nickname, :email, :password, :password_confirmation, :url
      )
    end
end
