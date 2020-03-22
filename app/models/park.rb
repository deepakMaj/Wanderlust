class Park < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :description, presence: true, length: {maximum: 2000}
  validates :url, presence: true

  has_many :parkcomments
end
