class Guest < ApplicationRecord
  belongs_to :evening
  belongs_to :character
end
