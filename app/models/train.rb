class Train < ApplicationRecord
    has_many :tickets
    has_many :schedules
    belongs_to :user
end
