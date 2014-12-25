class Restaurant < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :phone, presence: true
  validates :address, presence: true
  validates :comment, presence: true
  #validates :genre_ids, presence: true

  # photoをattachファイルとする。stylesで画像サイズを定義できる
   has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }

  # ファイルの拡張子を指定（これがないとエラーが発生する）
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  has_many :genre_restaurants, dependent: :destroy
  has_many :genres, through: :genre_restaurants

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
