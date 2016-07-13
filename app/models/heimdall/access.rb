module Heimdall
  class Access

    def self.can? authorizable_id, controller_action, group_id
      cached_features = Cache::Feature.from_group_and_namespace authorizable_id, group_id, controller_action
      role_ids = cached_features.uniq{ |f| f[:role_id]}.map{ |f| f[:role_id]}

      role_ids.each do |role_id|
        return true if allowed_for_role? role_id, cached_features
      end
      false
    end

    private

    def self.allowed_for_role? role_id, cached_features
      return false if forbidden_for_role? role_id, cached_features
      cached_features.detect{ |feature| feature[:allowed] && feature[:role_id] == role_id }.present?
    end

    def self.forbidden_for_role? role_id, cached_features
      cached_features.detect{ |feature| feature[:forbidden] && feature[:role_id] == role_id }.present?
    end
  end
end