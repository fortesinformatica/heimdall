module Heimdall
  module Cache
    class Feature
      def self.key_cache authorizable_id
        "#{Rails.application.class.parent_name}_heimdall_allowed_features_#{authorizable_id}"
      end

      def self.by_authorizable authorizable_id
        key = key_cache(authorizable_id)
        Rails.cache.write(key, hash_from_database(authorizable_id)) unless Rails.cache.exist?(key)
        Rails.cache.read(key)
      end

      def self.hash_from_database authorizable_id
        features = Heimdall::Feature.by_authorizable(authorizable_id)
        features.map {|feature| {namespace: feature.namespace} }
      end
    end
  end
end