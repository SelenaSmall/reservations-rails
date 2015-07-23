class CustomersController < ApplicationController
  before_action :set_user
  before_action :set_venue
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /tabs
  # GET /tabs.json
  def index
    @customers = @venue.customers.all
  end

#  def search
#    if @customer.search(customer_params)
#      @customers = Customer.search(params[:search]).order("created_at DESC")
#    else
#      @customers = Customer.order("created_at DESC")
#    end
#  end

  # GET /tabs/1
  # GET /tabs/1.json
  def show
  end

  # GET /tabs/new
  def new
    @customer = @venue.customers.build
  end

  # GET /tabs/1/edit
  def edit
  end

  # POST /tabs
  # POST /tabs.json
  def create
    @customer = @venue.customers.build(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to [@user, @venue, @customer], notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tabs/1
  # PATCH/PUT /tabs/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to [@user, @venue, @customer], notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tabs/1
  # DELETE /tabs/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to user_venue_customers_path(@venue), notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_venue
      @venue = Venue.find(params[:venue_id])
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end

#    def search_customer
#      @customer = Customer.search(params[:search])
#    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :phone, :email)
    end
end
