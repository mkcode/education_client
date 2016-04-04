require 'spec_helper'

describe EducationStats::Client do
  describe 'forwarded methods' do
    subject { described_class.new( [Statsd.new, Statsd.new, Statsd.new] )}

    described_class::FORWARD_METHODS.each do |method|
      it "calls the #{method} method on every client" do
        subject.all_clients.each do |client|
          expect(client).to receive(method)
        end
        subject.send(method)
      end
    end
  end
end
