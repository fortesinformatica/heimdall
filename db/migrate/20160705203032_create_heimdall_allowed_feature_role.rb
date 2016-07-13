class CreateHeimdallAllowedFeatureRole < ActiveRecord::Migration
  def change
    create_table :heimdall_allowed_feature_roles do |t|
      t.references :role, index: true
      t.references :feature, index: true
    end
  end
end
