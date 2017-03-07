class EnrollmentsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]
  def index
     @date = Date.parse(params[:date] || Date.today.to_s)
     # TODO this action should accept a day parameter params[:date]
     @enrollments = Enrollment.all
     @timeslots = TimeSlot.all
     @users = User.all
     # TODO scope timeslots to the current dates day
  end

  def new
    @date = Date.parse(params[:date] || Date.today.to_s)
    @timeslots = TimeSlot.where(day: @date.wday)
  end

  def create
    @date = Date.parse(params[:date])
    Enrollment.where(user: current_user, date: @date).destroy_all
    
    params['enrollment']['time_slot_ids'].each do |time_slot_id|
      Enrollment.create(user: current_user, time_slot_id: time_slot_id, date: @date) 
      # TODO  change date to a date type in database
      # TODO pass the date from the form  when creating these enrollments
    end
    redirect_to enrollments_path
  end

end
