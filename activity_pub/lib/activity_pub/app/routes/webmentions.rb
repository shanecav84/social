# frozen_string_literal: true

module ActivityPub
  App.hash_branch('webmentions') do |r|
    r.is do
      r.post do
        webmention_params = r.params.
          slice('source', 'target').
          reject { |k, v| v.empty? }
        r.halt 400 if webmention_params.count != 2

        DB[:activity_pub_webmentions].
          insert(webmention_params.merge(created_at: DateTime.now))
        response.status = 201
        ''
      end
    end
  end
end
