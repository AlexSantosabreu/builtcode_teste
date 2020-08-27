require 'rails_helper'

RSpec.describe "doctors/show", type: :view do
  before(:each) do
    @doctor = assign(:doctor, Doctor.create!(
      name: "Name",
      crm: "Crm",
      crm_uf: "Crm Uf"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Crm/)
    expect(rendered).to match(/Crm Uf/)
  end
end
