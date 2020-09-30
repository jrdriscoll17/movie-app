# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :movie_genres
  has_many :genres, through: :movie_genres

  has_many :movie_actors
  has_many :actors, through: :movie_actors

  has_many :reviews
  has_many :users, through: :reviews

  validates :name, presence: true
end
