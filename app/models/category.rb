class Category < ApplicationRecord
  belongs_to :household

  has_many :bills, dependent: :nullify
  has_many :documents, dependent: :nullify
  has_many :events, dependent: :nullify

  validates :name, presence: true, length: { maximum: 100 }
  validates :name, uniqueness: { scope: :household_id, case_sensitive: false }

  # optional (only if you keep "kind")
  VALID_KINDS = %w[bill document event].freeze
  validates :kind, inclusion: { in: VALID_KINDS }, allow_blank: true
end
