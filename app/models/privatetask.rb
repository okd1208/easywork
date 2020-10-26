class Privatetask < ApplicationRecord
  belongs_to :user
  
  validates :task, presence: true, length: { maximum: 255 }
  
  validates :deadline, presence: true
  validates :progress, presence: false
  # validates :category, presence: true
  
  has_one :status
end
