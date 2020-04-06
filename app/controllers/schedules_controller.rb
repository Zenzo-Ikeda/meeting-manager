class SchedulesController < ApplicationController
  before_action :require_user_logged_in
  #before_action :check_user, only: [:show,:edit,:update,:destroy]
    
    def index
      @schedules = Schedule.order(id: :asc).page(params[:page]).per(25)
    end
    
    def show
      @schedule = Schedule.find(params[:id])  
    end
    
    def edit
      @schedule = Schedule.find(params[:id])
    end

    def update
      @schedule = Schedule.find(params[:id])
      @schedule.status = 1
      @schedule.user = current_user
      @schedule.update(schedule_params)
      redirect_to schedule_path(@schedule)
    end 
    
    def reserve
      schedule = Schedule.find(params[:id])
      #schedule.status = 1
      #schedule.user = current_user
      #schedule.save
      #redirect_back(fallback_location: root_url)
      #@schedule = schedule
      redirect_to edit_schedule_path(schedule)
    end
    
    def cancel
      schedule = Schedule.find(params[:id])
      schedule.status = 0
      schedule.user = nil
      schedule.title = nil
      schedule.description = nil
      schedule.save
      redirect_back(fallback_location: root_url)
    end
    
   
   private

   def schedule_params
      params.require(:schedule).permit(:date, :segment, :title, :description)
   end 
   
  def check_user
    #redirect_to signup_url if @task.nil? || current_user != @task.user
    redirect_to root_url if current_user != @schedule&.user
    return
  end
  
end

   