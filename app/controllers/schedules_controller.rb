class SchedulesController < ApplicationController
    
    def index
      @schedules = Schedule.all
    end
    
   def reserve
       schedule = Schedule.find(params[:id])
      schedule.status = 1
      schedule.user = current_user
      schedule.save
      redirect_back(fallback_location: root_url)
    end
    
    def cancel
      schedule = Schedule.find(params[:id])
      schedule.status = 0
      schedule.user = nil
      schedule.save
      redirect_back(fallback_location: root_url)
    end 
     
end
