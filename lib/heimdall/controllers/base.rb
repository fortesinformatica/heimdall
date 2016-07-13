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
        def auth_group_id
          nil
        end

        def authorize_user!
          raise CurrentUserNotDefinedError unless current_user.present?

          if !can?(current_user, params[:controller], params[:action], auth_group_id)
            raise Heimdall::UnauthorizedError
          end
        end

        def can? user, controller, action, group_id
          controller_action = params[:controller]+"#"+params[:action]
          Access.can?(user.id, controller_action, group_id)
        end
    end
  end
end
