class Recess < ActiveRecord::Base
  attr_accessible :r_start, :r_stop, :user_id
  belongs_to :user
  has_many :categories, through: :user
end
