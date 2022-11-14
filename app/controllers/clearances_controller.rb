class ClearancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clearance, only: %i[ show edit update destroy ]
  before_action :clearance_limit, only: %i[ new create ]

  # GET /clearances or /clearances.json
  def index
    @clearances = current_user.clearances.order(created_at: :desc)
  end

  # GET /clearances/1 or /clearances/1.json
  def show
  end

  # GET /clearances/new
  def new
    @clearance = Clearance.new
  end

  # GET /clearances/1/edit
  def edit
  end

  # POST /clearances or /clearances.json
  def create
    @clearance = current_user.clearances.new(clearance_params)
    if @clearance.save
        redirect_to @clearance, notice: "Your clearance has been submitted successfully and now pending. Kindly remain patient as we work on it. Keep an eye on the notifications icon for updates."
    else
        render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clearances/1 or /clearances/1.json
  def update
    if @clearance.user == current_user
        if @clearance.update(clearance_params)
            redirect_to @clearance, notice: "Clearance record successfully updated"
        else
            render :edit, status: :unprocessable_entity
        end
    end
  end

  # DELETE /clearances/1 or /clearances/1.json
  def destroy
    if @clearance.user == current_user
        @clearance.destroy
        redirect_to clearances_url, notice: "clearance record successfully deleted"
    else
        redirect_to clearances_path, alert: "You are not authorized"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clearance
      @clearance = Clearance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def clearance_params
      params.require(:clearance).permit(:link, :degree, :session)
    end

    def clearance_limit
      @successful_clearance = current_user.clearances.successful
      @pending_clearance = current_user.clearances.pending
      if @successful_clearance.count == 1 && @pending_clearance.count == 1 || @successful_clearance.count == 2 || @pending_clearance.count == 2
        redirect_to clearances_path, alert: "Either one of your two clearances is not rejected yet."
      end
    end
end
