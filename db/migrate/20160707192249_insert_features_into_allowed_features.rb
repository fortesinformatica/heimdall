class InsertFeaturesIntoAllowedFeatures < ActiveRecord::Migration
  class HeimdallFeaturesRole < ActiveRecord::Base
    self.table_name = "heimdall_features_roles"

    belongs_to :role
    belongs_to :feature
  end

  def up
    HeimdallFeaturesRole.all.each do |feature_role|
      role = Heimdall::Role.find(feature_role.role_id)
      role.allowed_features << Heimdall::Feature.find(feature_role.feature_id)
    end
  end

  def down

  end
end