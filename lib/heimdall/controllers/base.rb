module Heimdall
  module Controllers
    module Base
      extend ActiveSupport::Concern

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
