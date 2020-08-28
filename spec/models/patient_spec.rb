require 'rails_helper'

RSpec.describe Patient, type: :model do
  it 'is valid with name, crm and crm_uf' do
    patient = Patient.create(name: 'Vitoria', birth_date: '2020-08-28', ccpf: 'rj')
    expect(patient).to be_valid
  end

  it 'is invalid without name' do
    patient = Patient.build(name: nil, birth_date: '2020-08-28', cpf: 'rj')
    patient.valid?
    expect(patient.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without crm' do
    patient = Patient.build(name: 'Vitoria', birth_date: 2020-08-28, cpf: 'rj')
    patient.valid?
    expect(patient.errors[:crm]).to include("can't be blank")
  end

  it 'is invalid without crm_uf' do
    patient = Patient.build(name: 'Vitoria', birth_date: '2020-08-28', cpf: nil)
    patient.valid?
    expect(patient.errors[:crm_uf]).to include("can't be blank")
  end
end
