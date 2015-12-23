module Heimdall
  class Role < ActiveRecord::Base
    belongs_to :authorizable, polymorphic: true
    
    has_and_belongs_to_many :features

    scope :by_authorizable, -> (authorizable_id) {
      where(authorizable_id: authorizable_id)
    }
  end
end
