class Event < ApplicationRecord
  belongs_to  :host, class_name: "User"
  has_many    :signups, dependent: :destroy

  validates :name,          presence: true, length: { maximum: 50 }
  validates :host_id,       presence: true
  validates :date,          presence: true
  validates :venue,         presence: true, length: { maximum: 250 }
  validates :num_guests,    presence: true
  validates :cuisine,       presence: true
  validates :cost_per_pax,  presence: true


end
