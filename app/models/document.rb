class Document < ApplicationRecord
  belongs_to :household
  belongs_to :category
  belongs_to :bill, optional: true

  has_one_attached :file

  validates :title, presence: true, length: { maximum: 255 }
  validates :category, presence: true
  validates :document_month, presence: true

  validate :file_presence
  validate :file_is_pdf
  validate :file_size_limit

  before_validation :populate_metadata_from_file, if: -> { file.attached? }

  MAX_FILE_SIZE = 10.megabytes

  private

  def file_presence
    errors.add(:file, "must be attached") unless file.attached?
  end

  def file_is_pdf
    return unless file.attached?
    ok_types = ["application/pdf"]
    errors.add(:file, "must be a PDF") unless ok_types.include?(file.content_type)
  end

  def file_size_limit
    return unless file.attached?
    errors.add(:file, "must be <= 10MB") if file.blob.byte_size > MAX_FILE_SIZE
  end

  def populate_metadata_from_file
    self.original_filename ||= file.filename.to_s
    self.file_size_bytes ||= file.blob.byte_size

    # helpful default: set title from filename if empty
    self.title = original_filename if title.blank?
  end
end
