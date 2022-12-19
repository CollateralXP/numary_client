# frozen_string_literal: true

RSpec.describe NumaryClient do
  it 'has a version number' do
    expect(NumaryClient::VERSION).to eq('0.1.0')
  end

  describe '.configure' do
    it 'yields configuration' do
      expect { |b| described_class.configure(&b) }.to yield_with_args(described_class.configuration)
    end
  end
end
