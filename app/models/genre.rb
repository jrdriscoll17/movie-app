class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies, through: :movie_genres
  has_many :actors, through: :movies

  validates :name, presence: true
end
