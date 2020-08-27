require 'rails_helper'

RSpec.describe "doctors/new", type: :view do
  before(:each) do
    assign(:doctor, Doctor.new(
      name: "MyString",
      crm: "MyString",
      crm_uf: "MyString"
    ))
  end

  it "renders new doctor form" do
    render

    assert_select "form[action=?][method=?]", doctors_path, "post" do

      assert_select "input[name=?]", "doctor[name]"

      assert_select "input[name=?]", "doctor[crm]"

      assert_select "input[name=?]", "doctor[crm_uf]"
    end
  end
end
