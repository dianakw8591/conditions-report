class Station < ApplicationRecord
    has_many :data
    belongs_to :location
end
