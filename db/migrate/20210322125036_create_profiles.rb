class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true, null: false
      t.string :status, null: false
      t.timestamps
    end
  end
end
