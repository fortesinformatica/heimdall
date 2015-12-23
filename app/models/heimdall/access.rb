module Heimdall
  class Access

    def self.can? authorizable_id, controller_path
      Cache::Feature.by_authorizable(authorizable_id).select {|feature| controller_path.index("#{feature[:namespace]}/") }.any?
    end
  end
end