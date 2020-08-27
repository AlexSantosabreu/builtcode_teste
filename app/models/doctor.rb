class Doctor < ApplicationRecord

  validates :name, :crm, presence: true
  validates :crm_uf, length: {is: 2}, presence: true

  def validate_crm_uf
    errors.add(:crm, "this crm exist in that crm_uf") if Doctor.where(crm: self.crm, crm_uf: self.crm_uf).exists?
  end
end
