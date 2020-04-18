class Admin::SchedulesController < Admin::Base
    def new
        if Schedule.all
            @schedule = Schedule.last
        else
            @schedule = Schedule.new(day: Date.today)
        end
    end 
    
    def create
        start_day = Schedule.last.date + 1
        last_day = start_day.end_of_month

        (start_day..last_day).each do |day|
            Schedule.create(date: day, segment: 0,room_id: 1)
            Schedule.create(date: day, segment: 1,room_id: 1)
            Schedule.create(date: day, segment: 0,room_id: 2)
            Schedule.create(date: day, segment: 1,room_id: 2)
        end 
        flash[:success] = '新たな予約枠を設定しました。'
       redirect_to admin_root_path 
    end
end
