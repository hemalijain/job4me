class EmploymentsController < ApplicationController
  before_action :set_employment, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: [:show,:index]

  # GET /employments
  # GET /employments.json
  def index
    @opening = Opening.find(params[:opening_id])  
    @employments = Opening.find(params[:opening_id]).employments
  end

  def get_list
    @employments = current_user.employments
    authorize current_user
  end


  # GET /employments/1
  # GET /employments/1.json
  def show
  end

  # GET /employments/new
  def new

    @opening = Opening.find(params[:opening_id])
    @employment = Employment.new(:opening_id =>@opening.id)
    authorize @employment
  end

  # GET /employments/1/edit
  def edit
    @opening = Opening.find(params[:opening_id])
    authorize @employment
  end

  # POST /employments
  # POST /employments.json
  def create
    @employment = Employment.new(employment_params)
    authorize @employment

    existing_application = Employment.where(:opening_id=>params['employment'][:opening_id], :user_id=> current_user.id)
    respond_to do |format|
      if  existing_application.count == 0
        if @employment.save
          NotificationMailer.job_application_confirmdation_to_user(@employment.user).deliver
          NotificationMailer.job_application_notification_to_organisation(@employment.opening.user, @employment).deliver
          format.html { redirect_to openings_path, notice: 'Employment was successfully created.' }
          format.json { render :show, status: :created, location: @employment }     
        else
          format.html { render :action=>'new', :params=>{:opening=> @employment.opening }}
          format.json { render json: @employment.errors, status: :unprocessable_entity }
        end

      elsif existing_application.count > 0
        @employment.errors.add(:user_id, :not_unique, message: "You have already applied for this job")
        format.html { render :action=>'new', :params=>{:opening=> @employment.opening } }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
        
    end
    end
  end

  # PATCH/PUT /employments/1
  # PATCH/PUT /employments/1.json
  def update
    authorize @employment
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
    authorize @employment
    @employment.destroy
    respond_to do |format|
      format.html { redirect_to employments_url, notice: 'Employment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def schedule_interview
    @employment = Employment.find(params[:id])
    authorize @employment
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
