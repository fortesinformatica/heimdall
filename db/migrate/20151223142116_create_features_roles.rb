class CreateFeaturesRoles < ActiveRecord::Migration
  def change
    create_table :heimdall_features_roles do |t|
      t.references :role, index: true
      t.references :feature, index: true

      t.timestamps null: false
    end
  end
end
