class GenreRestaurant < ActiveRecord::Base
  belongs_to :restaurant, class_name: "Restaurant"
  belongs_to :genre, class_name: "Genre"
  validates :restaurant_id, presence: true
  validates :genre_id, presence: true
end
