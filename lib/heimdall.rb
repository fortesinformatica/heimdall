require "heimdall/engine"

module Heimdall

  module Controllers
    autoload :Base, 'heimdall/controllers/base'
  end

  autoload :UnauthorizedError, 'heimdall/exceptions'

  ActiveSupport.on_load(:action_controller) do
    self.class_eval do
      include Heimdall::Controllers::Base
    end
  end
end
