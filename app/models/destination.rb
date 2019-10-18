class Destination < ApplicationRecord
    has_many :posts
    has_many :destination, through: :posts

    
end
