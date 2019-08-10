# frozen_string_literal: true

require 'sequel'

module ActivityPub
  DATABASE_URL = ENV.fetch('DATABASE_URL') { 'postgres://localhost/activity_pub_dev' }
  DB = ::Sequel.connect(DATABASE_URL)
end
