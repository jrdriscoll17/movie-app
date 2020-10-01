# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :rating, :content, presence: true
  validates :content, uniqueness: true
end
