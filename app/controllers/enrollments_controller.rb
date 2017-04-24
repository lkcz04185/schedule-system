class EnrollmentsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]
  def index
     
     @date = Date.parse(params[:date] || Date.today.to_s)
     @current_date = Date.parse(Date.today.to_s)
     # TODO this action should accept a day parameter params[:date]
     @enrollments = Enrollment.where("date = ?", @date)
     @timeslots = TimeSlot.where("day= ?", @date.strftime("%u")).order("start_time").all
     @users = User.all
     # TODO scope timeslots to the current dates day
  end

  def new
    @date = Date.parse(params[:date] || Date.today.to_s)
    @current_date = Date.parse(Date.today.to_s)
    @timeslots = TimeSlot.where(day: @date.wday)   
      if @date < @current_date
        flash[:error] = "#{@date.strftime("%a, %e.%_m. %_Y")} is a past enrollment, please select another day."
      end
  end

  def create
    @date = Date.parse(params[:date])    
   
    Enrollment.where(user: current_user, date: @date).destroy_all
      
      params['enrollment']['time_slot_ids'].each do |time_slot_id|
        Enrollment.create(user: current_user, time_slot_id: time_slot_id, date: @date, day: @date.strftime("%u")) 
        # TODO  change date to a date type in database
        # TODO pass the date from the form  when creating these enrollments
      end
    redirect_to enrollments_path
  end

end
