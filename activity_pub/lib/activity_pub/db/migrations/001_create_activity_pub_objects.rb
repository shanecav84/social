# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :activity_pub_objects do
      primary_key :id
      column :source, 'jsonb'
      DateTime :created_at, null: false
      DateTime :updated_at
    end
  end
end
