class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_one :address # colocado manualmente para dizer que tem 1 endereço
  has_many :phones # tem que ser no plural pois são muitos para um
  belongs_to :user
  # Gem FriendlyId
  include FriendlyId
  friendly_id :name, use: :slugged

  scope :to_the, ->(user) { where(user: user) }
  scope :search, ->(q) { where("lower(name) LIKE ?", "%#{q.downcase}%") }

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true
end
