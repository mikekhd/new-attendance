class Attendance < ActiveRecord::Base
  attr_accessible :login, :logout, :user_id
  belongs_to :user
   def start_time
    login
   end
   def title
    "#{user.email.split('@')[0]} : #{hours_for_day} hrs"
   end
   def hours_for_day(date = login)
     if logout==nil
      Time.at(DateTime.now-login).utc.strftime("%H:%M")
     else
     Time.at(logout-login).utc.strftime("%H:%M")
     end
    
  end
end
