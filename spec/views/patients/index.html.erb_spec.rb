require 'rails_helper'

RSpec.describe "patients/index", type: :view do
  before(:each) do
    assign(:patients, [
      Patient.create!(
        name: "Name",
        cpf: "Cpf"
      ),
      Patient.create!(
        name: "Name",
        cpf: "Cpf"
      )
    ])
  end

  it "renders a list of patients" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Cpf".to_s, count: 2
  end
end
