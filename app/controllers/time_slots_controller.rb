class TimeSlotsController < ApplicationController
  before_action :authenticate_user!
  def index
    @time_slots = TimeSlot.order("time_slot_index").all
  end

  def create
    @time_slot = TimeSlot.create(time_slot_params)
    redirect_to time_slots_path
  end

  def update
  end

  def edit
     @time_slot = TimeSlot.find(params[:id])
  end

  def destroy
    @time_slot = TimeSlot.find(params[:id])
    @time_slot.destroy
    redirect_to time_slots_path
  end

  private

  def time_slot_params
    params.require(:time_slot).permit(:time_slot_index, :day, :start_time, :finish_time)
  end
end
