class Ticket < ApplicationRecord
    belongs_to :user
    belongs_to :schedule
    has_one :train
    has_one :payment  , dependent: :destroy
end
