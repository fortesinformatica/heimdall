module Heimdall
  class Feature < ActiveRecord::Base
    has_and_belongs_to_many :is_allowed_for_roles, class_name: "Heimdall::Role", join_table: :heimdall_allowed_feature_roles
    has_and_belongs_to_many :is_forbidden_for_roles, class_name: "Heimdall::Role", join_table: :heimdall_forbidden_feature_roles
    
    scope :allowed_by_authorizable, -> (authorizable_id) {
      joins(:is_allowed_for_roles).merge(Role.by_authorizable(authorizable_id))
    }

    scope :forbidden_by_authorizable, -> (authorizable_id) {
      joins(:is_forbidden_for_roles).merge(Role.by_authorizable(authorizable_id))
    }

    scope :allowed_by_group, -> (group_id) {
      joins(:is_allowed_for_roles).merge(Role.by_group(group_id))
    }

    scope :forbidden_by_group, -> (group_id) {
      joins(:is_forbidden_for_roles).merge(Role.by_group(group_id))
    }
  end
end
