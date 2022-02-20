class Article < ApplicationRecord
  include Filterable, HasGenericScopes
  belongs_to :user, required: true
  has_many :favourite_articles, dependent: :destroy

  validates :title, :content, presence: true
  validates :title, length: { minimum: 3, maximum: 50 }
  validates :content, length: { minimum: 1, maximum: 300 }

  generate_default_ilike_scopes :title
end