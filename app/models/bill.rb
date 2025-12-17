class Bill < ApplicationRecord
  belongs_to :household
  belongs_to :category

  has_many :documents, dependent: :nullify

  STATUSES = %w[pending paid].freeze

  validates :name, presence: true, length: { maximum: 90 }
  validates :category, presence: true
  validates :due_on, presence: true
  validates :amount_cents, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :currency, presence: true, length: { is: 3 }
  validates :status, presence: true, inclusion: { in: STATUSES }

  validate :paid_on_consistency

  private

  def paid_on_consistency
    if status == "paid"
      errors.add(:paid_on, "must be set when bill is paid") if paid_on.blank?
    else
      errors.add(:paid_on, "must be blank unless bill is paid") if paid_on.present?
    end
  end
end
