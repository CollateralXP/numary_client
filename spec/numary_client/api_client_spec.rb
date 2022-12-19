# frozen_string_literal: true

RSpec.describe NumaryClient::ApiClient do
  describe '#get' do
    subject { described_class.current_client.get('/_info') }

    before do
      stub_request(:get, 'http://localhost:3068/_info')
        .to_return(status: 200, body: '{"data":{"server":"numary-ledger","version":"1.8.1"}}')
    end

    it 'returns server info' do
      expect(subject['data']['server']).to eq('numary-ledger')
    end
  end
end
