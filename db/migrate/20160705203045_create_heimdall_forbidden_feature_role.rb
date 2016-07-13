class CreateHeimdallForbiddenFeatureRole < ActiveRecord::Migration
  def change
    create_table :heimdall_forbidden_feature_roles do |t|
      t.references :role, index: true
      t.references :feature, index: true
    end
  end
end