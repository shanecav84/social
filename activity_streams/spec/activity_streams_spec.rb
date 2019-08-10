RSpec.describe ActivityStreams do
  it "has a version number" do
    expect(ActivityStreams::VERSION).not_to be nil
  end

  describe '#from_json' do
    it 'delegates to factory' do
      json = '{}'
      factory = instance_double('ActivityStreams::Factory', build: nil)

      expect(ActivityStreams::Factory).
        to receive(:new).
        with(json).
        and_return(factory)

      described_class.from_json(json)
    end
  end
end
