module Heimdall
  module Cache
    class Feature
      def self.key_cache authorizable_id
        "#{Rails.application.class.parent_name}_heimdall_features_#{authorizable_id}"
      end

      def self.for_authorization authorizable_id, group_id
        key = self.key_cache(authorizable_id)
        self.append(key, self.features_from_database(authorizable_id, group_id)) unless self.exists_for_group?(key, group_id)
        Rails.cache.read(key)
      end

      def self.from_group_and_namespace authorizable_id, group_id, namespace
        self.for_authorization(authorizable_id, group_id).select{ |feature|
          (group_id.nil? || feature[:group_id].eql?(group_id)) && namespace.index("#{feature[:namespace]}").eql?(0) 
        }
      end

      def self.append key, hash 
        entries = Rails.cache.read(key) || []
        Rails.cache.write(key, entries.concat(hash))
      end

      def self.exists_for_group? key, group_id
        Rails.cache.exist?(key) && Rails.cache.read(key).detect {|e| e[:group_id].eql?(group_id)}.present?
      end

      def self.features_from_database authorizable_id, group_id
        features = []
        roles = Heimdall::Role.by_authorizable(authorizable_id).by_group(group_id)

        roles.each do |role|
          role.allowed_features.map {|feature| features << {role_id: role.id, group_id: group_id, allowed: true, namespace: feature.namespace} }
          role.forbidden_features.map {|feature| features << {role_id: role.id, group_id: group_id, forbidden: true, namespace: feature.namespace} }
        end

        features
      end
    end
  end
end