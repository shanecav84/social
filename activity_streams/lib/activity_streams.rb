# frozen_string_literal: true

require 'active_model'
require 'json'

Dir[File.join(__dir__, 'activity_streams', '*.rb')].each { |f| require f }

module ActivityStreams
  class Error < StandardError; end
  class UnsupportedType < Error; end
  class << self
    def from_json(json)
      Factory.new(json).build
    end
  end
end
