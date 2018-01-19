class Product < ApplicationRecord
  has_many :order_items

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :avatar, presence: true
  
  attr_accessor :avatar, :avatar_cache, :remove_avatar


  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "120x120>" }, default_url: "/images/:style/user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
