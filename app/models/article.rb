class Article < ApplicationRecord
  include Filterable, HasGenericScopes
  belongs_to :user
  has_many :favourite_articles, dependent: :destroy

  generate_default_ilike_scopes :title
end