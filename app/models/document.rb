class Document < ApplicationRecord
  belongs_to :household
  belongs_to :category
  belongs_to :bill
end
