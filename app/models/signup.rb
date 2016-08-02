class Signup < ApplicationRecord
  belongs_to :guest, class_name: "User"
  belongs_to :event

  validates :event_id, presence: true
  validates :guest_id, presence: true
  validates :accepted, default: false
end
