# frozen_string_literal: true

require 'activity_pub/db'

module ActivityPub
  class App < ::Roda
    plugin :halt
    plugin :hash_routes
    plugin :head
    plugin :json
    plugin :json_parser
    plugin :middleware, env_var: 'activity_pub.app'
  end
end

require 'activity_pub/app/routes'
