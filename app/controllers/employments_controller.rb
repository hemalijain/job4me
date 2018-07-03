class EmploymentsController < ApplicationController
  before_action :set_employment, only: [:show, :edit, :update, :destroy]

  # GET /employments
  # GET /employments.json
  def index
    @opening = Opening.find(params[:opening_id])  
    @employments = Opening.find(params[:opening_id]).employments
  end

  # GET /employments/1
  # GET /employments/1.json
  def show
  end

  # GET /employments/new
  def new
    @opening = Opening.find(params[:opening_id])
    @employment = Employment.new(:opening_id =>@opening.id)
  end

  # GET /employments/1/edit
  def edit
    @opening = Opening.find(params[:opening_id])
  end

  # POST /employments
  # POST /employments.json
  def create
    @employment = Employment.new(employment_params)

    respond_to do |format|
      if @employment.save!
        NotificationMailer.job_application_confirmdation_to_user(@employment.user).deliver
        NotificationMailer.job_application_notification_to_organisation(@employment.opening.user, @employment).deliver
        format.html { redirect_to openings_path, notice: 'Employment was successfully created.' }
        format.json { render :show, status: :created, location: @employment }
      else
        format.html { redirect_to openings_path }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employments/1
  # PATCH/PUT /employments/1.json
  def update
    respond_to do |format|
      if @employment.update(employment_params)
        format.html { redirect_to openings_path, notice: 'Employment was successfully updated.' }
        format.json { render :show, status: :ok, location: @employment }
      else
        format.html { redirect_to openings_path }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employments/1
  # DELETE /employments/1.json
  def destroy
    @employment.destroy
    respond_to do |format|
      format.html { redirect_to employments_url, notice: 'Employment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def schedule_interview
    @employment = Employment.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employment
      @employment = Employment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employment_params
      params.require(:employment).permit(:name, :current_company, :ctc, :string, :ectc, :total_experience, :relevent_experience,:opening_id, :resume,:user_id)
    end
end
