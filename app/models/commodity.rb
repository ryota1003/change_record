class Commodity < ApplicationRecord
  # validates :user_id, presence: true
  # validates :registration_name, presence: true
  # validates :change_interval, presence: true
  
  belongs_to :user
end
