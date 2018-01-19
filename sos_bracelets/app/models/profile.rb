class Profile < ApplicationRecord
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :country, presence: true
  validates :phone, presence: true
  validates :avatar, presence: true

  attr_accessor :avatar, :avatar_cache, :remove_avatar

  has_attached_file :avatar,
  styles: { medium: "300x300#", thumb: "150x150#" },
  default_url: "/images/:style/user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  belongs_to :user
  belongs_to :team_profile
  has_many :contacts, as: :contactable, dependent: :destroy
  has_many :medical_conditions, as: :conditionable, dependent: :destroy
  has_many :addresses, as: :addressble, dependent: :destroy
  has_many :allergies, as: :allergable, dependent: :destroy
  has_many :medications, as: :medicationable, dependent: :destroy
  has_many :specials, as: :specialable, dependent: :destroy

  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :contacts
  accepts_nested_attributes_for :medical_conditions
  accepts_nested_attributes_for :allergies
  accepts_nested_attributes_for :medications
  accepts_nested_attributes_for :specials
end
