class Article < ApplicationRecord
  belongs_to :user
  has_many :favourite_articles, dependent: :destroy
end