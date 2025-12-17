class Household < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :bills, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :documents, dependent: :destroy

  validate :name, presence: true, length: { maximum: 50 }
end
