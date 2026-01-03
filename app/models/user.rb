class User < ApplicationRecord
  devise :databese_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :appointments, dependent: :destroy

  vaslidates :name, presence: true
end
