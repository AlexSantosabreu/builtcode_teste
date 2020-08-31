require 'rails_helper'

RSpec.describe "appointments/new", type: :view do
  before(:each) do
    assign(:appointment, Appointment.new(
      patient: nil,
      doctor: nil
    ))
  end

  it "renders new appointment form" do
    render

    assert_select "form[action=?][method=?]", appointments_path, "post" do

      assert_select "input[name=?]", "appointment[patient_id]"

      assert_select "input[name=?]", "appointment[doctor_id]"
    end
  end
end
