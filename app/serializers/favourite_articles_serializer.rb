class FavouriteArticlesSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :article
end
