class Blogger < ApplicationRecord
    has_many :posts
    has_many :destination, through: :posts

    validates :age,:name, presence: true
    validates :name, uniqueness: { case_sensitive: false }
    validates :bio, length: {minimum: 30}
    validates :age, numericality: {only_integer: true}
    validates :age, numericality: {greater_than: 0}
end
