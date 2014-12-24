class Genre < ActiveRecord::Base
has_many :genre_restaurants, dependent: :destroy
has_many :restaurants,  through: :genre_restaurants
validates :name, presence: true

end
