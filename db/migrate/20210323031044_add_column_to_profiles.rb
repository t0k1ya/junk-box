class AddColumnToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :title, :string, null: false, before: :status
    add_column :profiles, :is_deleted, :boolean, null: false, default: false, after: :status
  end
end
