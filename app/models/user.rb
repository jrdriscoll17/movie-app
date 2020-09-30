# frozen_string_literal: true

class User < ApplicationRecord
  has_many :reviews
  has_many :movies, through: :reviews

  has_secure_password

  validates :email, presence: true
  validates :email, uniquness: true
  validates :username, presence: true
  validates :username, uniquness: true
end
