# frozen_string_literal: true

require 'spec_helper'

module ActivityPub
  class App
    RSpec.describe '/inbox', type: :route do
      context 'POST /inbox' do
        context 'when the request has an empty body' do
          it 'returns a 400 response' do
            expect { post '/inbox' }.
              not_to change { DB[:activity_pub_objects].count }
            expect(last_response.status).to eq(400)
          end
        end

        context 'when the body is not valid JSON' do
          it 'returns a 400 response' do
            expect { post '/inbox', 'beepboop' }.
              not_to change { DB[:activity_pub_objects].count }
            expect(last_response.status).to eq(400)
          end
        end

        context 'when body is valid JSON' do
          it 'creates a record and returns a 201 status' do
            expect { post '/inbox', '{}' }.
              to change { DB[:activity_pub_objects].count }.by(+1)
            expect(last_response.status).to eq(201)
          end
        end
      end
    end
  end
end
