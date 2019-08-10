# frozen_string_literal: true

require 'bundler/setup'

require 'roda'
require 'sequel'

require 'activity_pub/app'
require 'activity_pub/configuration'

module ActivityPub
  def self.configure
    yield config
  end

  def self.config
    @configuration ||= Configuration.new
  end
end
