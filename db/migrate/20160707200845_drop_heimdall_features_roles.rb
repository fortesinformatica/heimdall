class DropHeimdallFeaturesRoles < ActiveRecord::Migration
  def up
    drop_table :heimdall_features_roles
  end

  def down
    create_table :heimdall_features_roles
  end
end