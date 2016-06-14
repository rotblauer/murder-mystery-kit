class Host < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # => host.evenings
  has_many :evenings, dependent: :destroy

  # => host.games 
  has_many :games, through: :evenings
end
