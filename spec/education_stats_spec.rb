require 'spec_helper'

describe EducationStats do
  it 'has a version number' do
    expect(EducationStats::VERSION).not_to be nil
  end

  before do
    described_class.reset
  end

  context 'the configure block' do
    before do
      described_class.configure do |config|
        config.hosted_graphite_api_key = 'abc123'
        config.add_statsd_client('fake-client')
      end
    end

    it 'sets parameters on the class' do
      expect(described_class.hosted_graphite_api_key).to eq('abc123')
      expect(described_class.all_clients).to include 'fake-client'
    end
  end

  describe '.use_hosted_graphite' do
    context 'when the hostedgraphite_api_key is set' do
      before do
        described_class.configure do |config|
          config.hosted_graphite_api_key = 'abc123'
        end
      end

      it 'returns true' do
        expect(described_class.use_hosted_graphite).to eq(true)
      end
    end

    context 'when the hostedgraphite_api_key is not set' do
      before do
        described_class.configure do |config|
          config.add_statsd_client('fake-client')
        end
      end

      it 'returns false' do
        expect(described_class.use_hosted_graphite).to eq(false)
      end
    end
  end
end
