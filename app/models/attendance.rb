class Attendance < ActiveRecord::Base
  attr_accessible :login, :logout, :user_id
  
  belongs_to :user
  has_many :recesses, through: :user
  
   def start_time
    login
   end
   def title
     ress =Time.at(recesses.recess_time(user).to_i).utc.strftime("%H:%M:%S")
    "#{user.email.split('@')[0]},  : #{hours_for_day} hrs, Recess :#{ress} "
   end
   def hours_for_day(date = login)
     start_time = self.login
     end_time = self.logout || start_time
     Time.at(end_time-start_time).utc.strftime("%H:%M")

   end
   
end
