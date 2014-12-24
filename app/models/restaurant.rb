class Restaurant < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :phone, presence: true
  validates :address, presence: true
  validates :comment, presence: true
  validates :genres, presence: true
  #validates :genre, presence: true 一旦保留

 # photoをattachファイルとする。stylesで画像サイズを定義できる
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }

  # ファイルの拡張子を指定（これがないとエラーが発生する）
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

has_many :genres, through: :genres_restaurants, source: :genres, dependent: :destroy
has_many :genres_restaurants, foreign_key: "restaurant_id", dependent: :destroy
#has_many :restaurant_genres, through: :genres_restaurants, source: :genre

#has_andは一旦保留
#has_and_belongs_to_many :genres
=begin
def categorizing?(genre)
  genre_restaurants.find_by(genre_id)
end

def categorize!(genre)
  genre_restaurants.create!(genre_id)
end
def uncategorize!(genre)
  genre_restaurants.find_by(genre_id).destroy
end
=end
end
