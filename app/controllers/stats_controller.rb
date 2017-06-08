class StatsController < ApplicationController

  def index

    if params[:from] && params[:to]
      from = Date.parse(params[:from])
      to  = Date.parse(params[:to])

      @enrollments_total = Enrollment.where(date: from..to).order("date").all.group(:date, :user_id).count
      @enrollments_date = Enrollment.where(date: from..to).order("date").all.group_by(&:date)
      @enrollments_sel = Enrollment.where(date: from..to).order("date").all.group_by{|e| [e.date, e.user_id]}
      @enrollments_user = Enrollment.where(date: from..to).order("date").all.group_by(&:user_id)
      @users = User.all
      @count = 0

    else
      @enrollments = []
      @enrollments_total = []
      @users = []
      @enrolled_members = []
      @enrollments_date = []
    end
   

  
  end

end
