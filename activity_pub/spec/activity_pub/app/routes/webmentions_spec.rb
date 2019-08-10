# frozen_string_literal: true

require 'spec_helper'

module ActivityPub
  class App
    RSpec.describe '/webmentions', type: :route do
      context 'POST /webmentions' do
        context 'source or target is missing' do
          it 'returns a 400 status' do
            expect {
              post '/webmentions',
                { source: 'https://example.com/1', target: '' }
            }.not_to change { DB[:activity_pub_webmentions].count }
            expect(last_response.status).to eq(400)

            expect {
              post '/webmentions',
                { source: '', target: 'https://example.com/1' }
            }.not_to change { DB[:activity_pub_webmentions].count }
            expect(last_response.status).to eq(400)

            expect {
              post '/webmentions',
                { source: '', target: '' }
            }.not_to change { DB[:activity_pub_webmentions].count }
            expect(last_response.status).to eq(400)
          end
        end

        context 'when the request includes source and target' do
          it 'returns creates a record and returns a 201 response' do
            expect {
              post '/webmentions',
                {
                  source: 'https://example.com/1',
                  target: 'https://example.com/2'
                }
            }.to change { DB[:activity_pub_webmentions].count }.by(+1)
            expect(last_response.status).to eq(201)
          end
        end
      end
    end
  end
end
