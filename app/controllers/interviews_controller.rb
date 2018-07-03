class InterviewsController < ApplicationController
  before_action :set_interview, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.user?
      @interviews = current_user.employments.map{|c| c.interview}.compact
    else
      employments = current_user.openings.map{|c| c.employments}
      employments_id= employments.to_a.map{|c| c.ids}.flatten
      @interviews = Interview.where("employment_id IN (?)", employments_id)
    end
  end

  def show
  end

  def new
    @interview = Interview.new(:employment_id=>params[:employment].to_i)
    employments = current_user.openings.map{|c| c.employments}
    @employments_id= employments.to_a.map{|c| c}.flatten
  end

  def edit
     employments = current_user.openings.map{|c| c.employments}
    @employments_id= employments.to_a.map{|c| c}.flatten
  end

  def create

    @interview= Interview.create!(interview_params)
    NotificationMailer.interview_schedule_notification(@interview.employment.user,@interview).deliver
  end 

  def update
    @interview.update(interview_params)
  end

  def destroy
    @interview.destroy
  end

  private
    def set_interview
      @interview = Interview.find(params[:id])
    end

    def interview_params
      params.require(:interview).permit(:title, :date_range, :start, :end, :color,:employment_id, :status)
    end
end