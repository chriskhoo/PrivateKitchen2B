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

  def event_status(user_id)
    if self.host_id == user_id
      "Host"
    elsif self.signups.where(accepted: true).count >= self.num_guests
      "Full"
    elsif self.signups.where(guest_id: user_id).empty?
      "Open"
    elsif self.signups.where(guest_id: user_id, accepted: true ).any?
      "Confirmed"
    else
      "Waitlisted"
    end
  end

end
