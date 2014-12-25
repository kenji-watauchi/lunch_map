class GenreRestaurant < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :genre
  #validates :restaurant_id, presence: true
  #validates :genre_id, presence: true
end
