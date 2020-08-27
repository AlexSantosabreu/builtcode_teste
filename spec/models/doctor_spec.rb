require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it 'is valid with name, crm and crm_uf' do
    doctor = Doctor.create(name: 'Armando', crm: '123654', crm_uf: 'rj')
    expect(doctor).to be_valid
  end

  it 'is invalid without name' do
    doctor = Doctor.build(name: nil, crm: '123654', crm_uf: 'rj')
    doctor.valid?
    expect(doctor.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without crm' do
    doctor = Doctor.build(name: 'Armando', crm: nil, crm_uf: 'rj')
    doctor.valid?
    expect(doctor.errors[:crm]).to include("can't be blank")
  end

  it 'is invalid without crm_uf' do
    doctor = Doctor.build(name: 'Armando', crm: '123654', crm_uf: nil)
    doctor.valid?
    expect(doctor.errors[:crm_uf]).to include("can't be blank")
  end
end
