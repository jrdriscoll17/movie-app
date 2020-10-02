# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  validates :title, presence: true, uniqueness: true

  accepts_nested_attributes_for :reviews

  scope :with_title, ->(title) { where('title = ?', title) }
end
