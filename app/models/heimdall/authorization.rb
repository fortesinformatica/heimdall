module Heimdall
  class Authorization < ActiveRecord::Base
    belongs_to :authorizable, polymorphic: true
    belongs_to :role

    scope :by_authorizable, -> (authorizable_id) {
      where(authorizable_id: authorizable_id)
    }
    
    def self.can? authorizable_id, controller_path
      cached_features(authorizable_id).select {|feature| controller_path.index("#{feature[:namespace]}/") }.any?
    end

    private
      def self.key_cache authorizable_id
        "#{Rails.application.class.parent_name}_heimdall_allowed_features_#{authorizable_id}"
      end

      def self.cached_features authorizable_id
        key = key_cache(authorizable_id)
        Rails.cache.write(key, hash_features_from_database(authorizable_id)) unless Rails.cache.exist?(key)
        Rails.cache.read(key)
      end

      def self.hash_features_from_database authorizable_id
        features = Feature.by_authorizable(authorizable_id)
        features.map {|feature| {namespace: feature.namespace} }
      end
  end
end
