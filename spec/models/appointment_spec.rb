require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:user) { User.create(name: "Matheus", email: "m@teste.com") }

  it "Is valid with valid attributes" do
    appt = Appointment.new(
      title: "Tattoo",
      start_time: 1.hour.from_now,
      end_time: 2.hours.from_now,
      user: user
    )

  it "prevents overlapping appointments" do
    Appointment.create!(
      title: "A",
      start_time: Time.now,
      end_time: 1.hour.from_now,
      user: user
    )

  appt = Appointment.new(
    title: "B",
    start_time: 30.minutes.from_now,
    end_time: 2.hours.from_now,
    user: user
  )

  expect(appt).not_to_be-valid
  end
end
