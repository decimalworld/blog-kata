# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :author, class_name: 'Users::Admin'
  validates :title, presence: true
  validates :summary, presence: true
  validates :body, presence: true
end
