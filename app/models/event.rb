class Event < ApplicationRecord
  belongs_to :household
  belongs_to :category

  validates :title, presence: true, length: { maximum: 120 }
  validates :start_at, presence: true
  validate :end_after_start

  private

  def end_after_start
    return if end_at.blank? || start_at.blank?
    errors.add(:end_at, "must be after start time") if end_at < start_at
  end
end
