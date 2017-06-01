class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_one :address # colocado manualmente para dizer que tem 1 endereço
  has_many :phones # tem que ser no plural pois são muitos para um

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true
end
