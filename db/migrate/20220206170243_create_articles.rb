class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.belongs_to :user, index: true, foreign_key: true
      t.boolean :visible, default: false, null: false
      t.timestamps
    end
  end
end
