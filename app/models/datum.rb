class Datum < ApplicationRecord
  belongs_to :station

  validates :date, uniqueness: { scope: :station_id}
end
