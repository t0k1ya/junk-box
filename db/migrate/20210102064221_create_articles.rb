class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true, null: false
      t.string :title, null: false
      t.string :status, null: false
      t.string :is_deleted, null: false, default: false
      t.timestamps
    end
  end
end
