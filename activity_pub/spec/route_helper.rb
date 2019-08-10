# frozen_string_literal: true

module RouteHelper
  def app
    builder = Rack::Builder.new
    builder.run ActivityPub::App
  end
end
