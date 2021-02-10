class CreateArticleCategoryRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :article_category_relations do |t|
      t.references :article, index: true, foreign_key: true
      t.timestamps
    end
  end
end
