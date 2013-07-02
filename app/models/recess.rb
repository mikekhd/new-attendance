class Recess < ActiveRecord::Base
  attr_accessible :r_start, :r_stop, :user_id
  
  belongs_to :user
  def self.recess_time(user)
    where("user_id = ?", user).select([:r_start, :r_stop]).map { |u| ((u.r_stop || u.r_start)-u.r_start) }.inject(:+)
  end

 
end
