class Enrollment < ActiveRecord::Base
# attr_accessor :time_slot_ids

belongs_to :user
belongs_to :time_slot


end
