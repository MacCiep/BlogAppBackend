class CreateFavouriteArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :favourite_articles do |t|
      t.belongs_to :user
      t.belongs_to :article
      t.timestamps
    end
  end
end
