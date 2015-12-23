module Heimdall
  module Controllers
    module Base
      extend ActiveSupport::Concern

      included do
        before_filter only: [:destroy] do |controller|
          if controller.is_a?(Devise::SessionsController) && current_user.present?
            Rails.cache.delete Cache::Feature.key_cache(current_user.id)
          end
        end
      end

      protected
        def authorize_user!
          if current_user.present? && !can?(current_user, self.class)
            raise "Sem autorização"
          end
        end

        def can? user, controller
          controller_path = controller.to_s.underscore
          Access.can?(user.id, controller_path)
        end
    end
  end
end
