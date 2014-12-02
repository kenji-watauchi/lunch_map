class Restaurant < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :phone, presence: true
  validates :address, presence: true
end
