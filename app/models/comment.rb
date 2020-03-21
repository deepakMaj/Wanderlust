class Comment < ApplicationRecord
  validates :body, presence: true, length: {maximum: 100}
  belongs_to :adventure
end
