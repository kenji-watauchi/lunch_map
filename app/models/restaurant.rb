class Restaurant < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :phone, presence: true
  validates :address, presence: true
  validates :comment, presence: true
  #validates :genre, presence: true 一旦保留

 # photoをattachファイルとする。stylesで画像サイズを定義できる
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }

  # ファイルの拡張子を指定（これがないとエラーが発生する）
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
