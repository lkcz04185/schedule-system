class StatsController < ApplicationController

  def index

    if params[:from] && params[:to]
      from = Date.parse(params[:from])
      to  = Date.parse(params[:to])

      @enrollments = Enrollment.where(date: from..to).order("date").all.group_by(&:date)
      @enrollments_sum = Enrollment.where(date: from..to)
      @enrollments_total = @enrollments_sum.group_by{|e| [e.user_id, e.date]}
      @enrolled_members = Enrollment.where(date: from..to).group_by(&:user_id)
      @users = User.all
      
    else
      @enrollments = []
      @enrollments_total = []
      @users = []
      @enrolled_members = []
    end
   

  
  end

end
