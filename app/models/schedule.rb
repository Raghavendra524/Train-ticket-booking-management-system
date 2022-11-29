class Schedule < ApplicationRecord
    belongs_to :train
    belongs_to :user
    has_many :places

end
