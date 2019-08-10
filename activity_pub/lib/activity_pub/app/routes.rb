# frozen_string_literal: true

%w[
  inbox
  webmentions
  well_known
].each { |route| require File.join('activity_pub', 'app', 'routes', route)}

module ActivityPub
  class App
    route { |r| r.hash_branches }
  end
end
