class Article < ApplicationRecord
  validates :title, presence: true
  validates :slug, uniqueness: true
end
