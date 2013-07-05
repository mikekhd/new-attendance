class User < ActiveRecord::Base
  attr_accessible :admin, :email, :name, :password, :password_confirmation
  has_secure_password
  has_many  :attendances
  has_many  :recesses
  has_many  :categories
  def login
    now = DateTime.now
    prev_day = now.prev_day.end_of_day
    next_day = now.next_day.beginning_of_day
    if attendances.where(login: (prev_day..next_day)).count.zero?
      attendances.create(login: DateTime.now)
      recess = recesses.last
      if recess.present?
         recess.r_stop= DateTime.now
         recess.save
      end
    end
  end
  def logout_for_day
    attendance = attendances.last
    attendance.logout = DateTime.now
    attendance.save
  end
  def logout
    if attendances.last.logout.nil?
      recesses.create(start_break:DateTime.now)
    end
  end
 
end 