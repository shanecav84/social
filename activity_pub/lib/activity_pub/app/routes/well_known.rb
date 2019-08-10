# frozen_string_literal: true

module ActivityPub
  App.hash_branch('.well-known') do |r|
    r.get 'webfinger' do
      resource_param = r.params['resource']
      r.halt 400 if resource_param.nil?
      if ActivityPub.config.webfinger_resource[:subject] != resource_param
        r.halt 404
      end

      response['Content-Type'] = 'application/jrd+json'
      ActivityPub.config.webfinger_resource
    end
  end
end
