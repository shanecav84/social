# frozen_string_literal: true

Dir[File.join(__dir__, 'concerns', '*.rb')].each { |f| require f }
Dir[File.join(__dir__, 'validators', '*.rb')].each { |f| require f }

module ActivityStreams
  class Model
    include ActiveModel::Model
    include ActiveModel::Attributes
    include Concerns::Serialization

    CONTEXT = 'https://www.w3.org/ns/activitystreams'

    attr_accessor :original_json

    attribute :'@context'
    alias_attribute :_context, :'@context'
    attribute :type, :string

    validate Validators::ContextValidator
    validates :type, inclusion: { in: ->(obj) { obj.class.name } }
  end
end

Dir[File.join(__dir__, 'extensions', '*.rb')].each { |f| require f }
Dir[File.join(__dir__, 'model', '*.rb')].each { |f| require f }
