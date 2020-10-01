# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  validates :title, presence: true
  validates :title, uniqueness: true

  accepts_nested_attributes_for :reviews

end
