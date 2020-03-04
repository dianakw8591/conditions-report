class User < ApplicationRecord
    has_many :posts
    belongs_to :location

    has_secure_password

    validates :username, {presence: true, uniqueness: true}
    validates :password, {presence: true, on: :create}
end
