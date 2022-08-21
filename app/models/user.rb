class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {minimum:3, maximum: 20}
  validates :password, presence: true, length: { minimum: 6 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable
end