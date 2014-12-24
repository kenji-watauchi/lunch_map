class Genre < ActiveRecord::Base
has_many :restaurants,  through: :genres_restaurants, source: :restaurant
has_many :genres_restaurants, foreign_key: "genre_id", dependent: :destroy
validates :name, presence: true

#has_and_belongs_to_many :restaurants
#has_many :restaurant_genres, through: :genre_restaurants, source: :restaurant
end
