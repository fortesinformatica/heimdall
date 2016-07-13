module Heimdall
  class Role < ActiveRecord::Base
    has_many :authorizations

    has_and_belongs_to_many :allowed_features, class_name: "Heimdall::Feature", 
                                               join_table: :heimdall_allowed_feature_roles

    has_and_belongs_to_many :forbidden_features, class_name: "Heimdall::Feature", 
                                               join_table: :heimdall_forbidden_feature_roles

    scope :by_authorizable, -> (authorizable_id) {
      joins(:authorizations).merge(Authorization.by_authorizable(authorizable_id))
    }

    scope :by_group, -> (group_id) {
      joins(:authorizations).merge(Authorization.by_group(group_id))
    }

    scope :by_name, -> (name){
      where(name: name)
    }
  end
end
