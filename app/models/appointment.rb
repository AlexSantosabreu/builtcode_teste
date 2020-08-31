class Appointment < ApplicationRecord
  validates_presence_of  :starts_at, :ends_at, :doctor_id, :patient_id
  validate :busy_schedule, on: :create

  belongs_to :patient
  belongs_to :doctor

  def busy_schedule
    errors.add(:appoitment, "this time is busy") if Appointment.where(doctor_id: self.doctor_id, starts_at: self.starts_at).exists?
  end
end
