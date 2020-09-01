class Appointment < ApplicationRecord
  validates_presence_of  :starts_at, :ends_at, :doctor_id, :patient_id
  validate :busy_schedule, on: :create
  validate :lunch_time, on: :create2

  belongs_to :patient
  belongs_to :doctor

  def busy_schedule
    errors.add(:appoitment, "this time is busy") if Appointment.where(doctor_id: self.doctor_id, starts_at: self.starts_at).exists?
  end

  def lunch_time
    errors.add(:appoitment, "this time lunch") if self.starts_at.hour == 12
  end
end
