class AddCategoryIdToArticleCategoryRelations < ActiveRecord::Migration[6.0]
  def change
    add_reference :article_category_relations, :category, foreign_key: true
  end
end
