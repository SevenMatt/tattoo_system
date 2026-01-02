class Appointment < ApplicationRecord
  belongs_to :user

  validates :title, :start_time, :end_time, presence: true
  validate :end_after_time
  validate :no_time_conflict

  def end_after_time
    return if end_time > start_time
    errors.add(:end_time, "must be after start time")
  end

  def no_time_conflict
    conflict = Appointment.where(user_id: user_id)
                          .where.not(id: id)
                          .where("star_time < ? AND end_time > ?", end_time, start_time)
    errors.add(:base, "Schedule conflict") if conflict.exists?
  end
end
