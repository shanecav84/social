# frozen_string_literal: true

module ActivityPub
  App.hash_branch('inbox') do |r|
    r.is do
      r.post do
        body = r.body.read
        JSON.parse(body)

        DB[:activity_pub_objects].
          insert(source: body, created_at: DateTime.now)
        response.status = 201
        ''
      rescue JSON::ParserError
        r.halt 400
      end
    end
  end
end
