class Attendance < ActiveRecord::Base
  attr_accessible :login, :logout, :user_id
  belongs_to :user
  has_many :recesses, through: :user
  
   def start_time
    login
   end
   def title
     ress =Time.at(recess_time.to_i).utc.strftime("%H:%M:%S")
    "#{user.email.split('@')[0]},  : #{hours_for_day} hrs, Recess :#{recess_time} "
   end
   def hours_for_day(date = login)
     end_time = logout || start_time
     Time.at(end_time-login).utc.strftime("%H:%M")
   end
   def recess_time
    recesses.where("user_id = ?", user).select([:r_start, :r_stop]).map { |u| ((u.r_stop || u.r_start)-u.r_start) }.inject(:+)
    end
end
