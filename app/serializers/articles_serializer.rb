class ArticlesSerializer
  include FastJsonapi::ObjectSerializer
  set_type :article
  attributes :title, :content, :visible
  belongs_to :user
end
