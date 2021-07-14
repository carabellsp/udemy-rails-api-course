# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :slug, uniqueness: true
end
