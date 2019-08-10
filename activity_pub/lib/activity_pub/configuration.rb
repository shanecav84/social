# frozen_string_literal: true

module ActivityPub
  class Configuration
    attr_accessor :webfinger_resource

    def initialize
      @webfinger_resource = {}
    end
  end
end
