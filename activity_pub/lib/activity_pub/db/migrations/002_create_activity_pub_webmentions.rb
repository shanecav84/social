# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :activity_pub_webmentions do
      primary_key :id
      String :source, text: true, null: false
      String :target, text: true, null: false
      DateTime :created_at, null: false
      DateTime :updated_at
    end
  end
end
