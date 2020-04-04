class SchedulesController < ApplicationController
    
    def index
      @schedules = Schedule.all
    end
    
    def show
      @schedule = Schedule.find(params[:id])  
    end
    
    def edit
      @schedule = Schedule.find(params[:id])
    end

    def update
      @schedule = Schedule.find(params[:id])
      @schedule.update(schedule_params)
      redirect_to schedule_path(@schedule)
    end 
    
    def reserve
      schedule = Schedule.find(params[:id])
      schedule.status = 1
      schedule.user = current_user
      schedule.save
      #redirect_back(fallback_location: root_url)
      redirect_to edit_schedule_path(schedule)
    end
    
    def cancel
      schedule = Schedule.find(params[:id])
      schedule.status = 0
      schedule.user = nil
      schedule.save
      redirect_back(fallback_location: root_url)
    end
    
   
   private

   def schedule_params
      params.require(:schedule).permit(:date, :segment, :title, :description)
   end 
  
end

   