class StatsController < ApplicationController

  def index
    if params[:from] && params[:to]
      from = Date.parse(params[:from])
      to  = Date.parse(params[:to])

      @enrollments_counts = Enrollment.where(date: from..to).select(:date).group(:date)
      @enrollments = Enrollment.where(date: from..to).group_by(&:date)
      @enrollments_sum = Enrollment.where(date: from..to)
      @enrollments_total = @enrollments_sum.group_by{|e| [e.user_id, e.date]}
      @enrolled_members = Enrollment.where(date: from..to).group_by(&:user_id)
      

      # <th class="dates"><%= (enrollment.date).strftime("%e.%_m.") %>
      # <% @enrollments.each do |enrollment| %>
      #     <tr>
      #      
      #       <td>  <%= @enrollments_counts %>
           
      #     </tr>
      #   <% end %>
    else
      @enrollments = []
    end
   

  
  end

end
