class Station < ApplicationRecord
    has_many :data
    has_many :posts
    belongs_to :location
end
