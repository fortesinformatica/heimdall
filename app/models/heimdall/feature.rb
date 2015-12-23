module Heimdall
  class Feature < ActiveRecord::Base
    has_and_belongs_to_many :roles

    scope :by_authorizable, -> (authorizable_id) {
      joins(:roles).merge(Role.by_authorizable(authorizable_id))
    }
  end
end
