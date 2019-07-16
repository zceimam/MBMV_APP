class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :owned_flats, class_name: "Flat" # we get .owned_flats method
  has_many :bookings # .bookings method
  has_many :booked_flats, through: :bookings, source: :flat # .booked_flats method

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
