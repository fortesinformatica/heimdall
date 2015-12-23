module Heimdall
  class Authorization < ActiveRecord::Base
    belongs_to :authorizable, polymorphic: true
    belongs_to :role

    scope :by_authorizable, -> (authorizable_id) {
      where(authorizable_id: authorizable_id)
    }
  end
end
